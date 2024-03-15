//
//  DataController.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/22/23.
//

import Foundation

class DataController: ObservableObject {
    
    @Published var currentUser = User()
    @Published var activeJobs = [Job]()
//    @Published var completedJobs = [Job]()
    
    let numbers = "01234567890"
    
    func decodeData<T: Decodable>(_ data: Data, _ type: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let results = try decoder.decode(type.self, from: data)
            return results
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            return nil
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch {
            print("error decoding data inside getUserJobs")
            return nil
        }
    }
    
    func userLogin(_ username: String, _ password: String, completion: @escaping () -> ()) {
        // TODO: UPDATE ONCE AUTHENTICATION IS WORKING INCLUDE USERNAME AND PASS IN PARAMS
        
        let params = ["email" : "user@example.com",
                      "password": "12344321abcddcba"]
        
        NWHConnector().generateGetRequest("login", params, onSuccess: { data, response in
            if let user = self.decodeData(data, User.self) {
                self.currentUser = user
                completion()
            }
        }, onError: { error in
            // TO-DO: Display error alert
            print("error occured calling user-login api: ")
            print(error.localizedDescription)
//            completion() DO NOT COMPLETE WITHOUT LOGIN SUCCESS
        })
    }
    
    func deleteUserJob(jobId: String, completion: @escaping () -> ()) {
        let params = ["id" : jobId]
        NWHConnector().generatePostRequest("removejob", params, onSuccess: { data, response in
            if let response = response as? HTTPURLResponse {
                guard (200 ... 299) ~= response.statusCode else { // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    completion()
                    return
                }
                
                self.activeJobs.removeAll(where: {$0.id == jobId})
                completion()
            } else {
                print("error occured calling addUserJob api function")
                completion()
            }
        }, onError: { error in
            // TO-DO: Display error alert
            print("error occured calling job-business-list-active api: ")
            print(error.localizedDescription)
            completion()
        })
    }
    
    func getUserJobs(completion: @escaping () -> ()) {
        let params = ["id" : currentUser.id]
        
        NWHConnector().generateGetRequest("businessJobs", params, onSuccess: { data, response in
            let decoder = JSONDecoder()
            
            if let activeJobs = self.decodeData(data, [Job].self) {
                self.activeJobs = activeJobs
                completion()
            }
        }, onError: { error in
            // TO-DO: Display error alert
            print("error occured calling job-business-list-active api: ")
            print(error.localizedDescription)
            completion()
        })
    }
    
    func addUserJob(_ job: Job, completion: @escaping () -> ()) {
        let params = ["business_user_id" : currentUser.id,
                      "job_title" : job.title ?? "",
                      "job_description" : job.details ?? "",
                      "target_budget" : String(format: "%.2f", job.targetBudget ?? 0.00),
                      "target_date" : job.serverFormatDateString(from: job.targetDate ?? "")] // TODO: FORMAT DATE PASSED INTO SERVICE
        
        NWHConnector().generatePostRequest("postjob", params, onSuccess: { data, response in
            if let response = response as? HTTPURLResponse {
                guard (200 ... 299) ~= response.statusCode else { // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    completion()
                    return
                }
                completion()
            } else {
                print("error occured calling addUserJob api function")
                completion()
            }
        }, onError: { error in
            // TO-DO: Display error alert
            print("error occured calling job-business-post api: ")
            print(error.localizedDescription)
            completion()
        })
    }
    
    func updateUserJob(_ job: Job, completion: @escaping () -> ()) {
        let params = ["job_id" : job.id,
                      "job_title" : job.title ?? "",
                      "job_description" : job.details ?? "",
                      "target_budget" : String(format: "%.2f", job.targetBudget ?? 0.00),
                      "target_date" : job.targetDate ?? ""]
        
        NWHConnector().generatePostRequest("updatejob", params, onSuccess: { data, response in
            if let response = response as? HTTPURLResponse {
                guard (200 ... 299) ~= response.statusCode else { // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    completion()
                    return
                }
                completion()
            } else {
                print("error occured calling addUserJob api function")
                completion()
            }
        }, onError: { error in
            // TO-DO: Display error alert
            print("error occured calling job-business-post api: ")
            print(error.localizedDescription)
            completion()
        })
    }
    
    func getEngProfile(_ id: String, completion: @escaping (EngineerProfile) -> ()) {
        let params = ["id" : "user-data-13cfdabb-0293-4cda-82fd-b90229994d96"] // TODO: remove once linked
        
        NWHConnector().generateGetRequest("engProf", params, onSuccess: { data, response in
            if let engProf = self.decodeData(data, EngineerProfile.self) {
                completion(engProf)
            }
        }, onError: { error in
            // TO-DO: Display error alert
            print("error occured calling user-login api: ")
            print(error.localizedDescription)
            completion(EngineerProfile())
        })
    }
    
    func getJobBids(_ jobId: String, completion: @escaping ([JobBid]) -> ()) {
        let params = ["job_id" : jobId]
        
        NWHConnector().generateGetRequest("jobbids", params, onSuccess: { data, response in
            if let jobBids = self.decodeData(data, [JobBid].self) {
                completion(jobBids)
            }
        }, onError: { error in
            // TO-DO: Display error alert
            print("error occured calling user-login api: ")
            print(error.localizedDescription)
            completion([JobBid]())
        })
    }
}
