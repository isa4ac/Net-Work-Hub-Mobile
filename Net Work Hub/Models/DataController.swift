//
//  DataController.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/22/23.
//

import Foundation

class DataController: ObservableObject {
    
    @Published var currentUserId = Int()
    @Published var activeJobs = [Job]()
//    @Published var completedJobs = [Job]()
    
    let numbers = "01234567890"
    
    func deleteUserJob(jobId: String, completion: @escaping () -> ()) {
        let params = ["job_id" : jobId]
        NWHConnector().generatePostRequest("job-business-remove", params, onSuccess: { data, response in
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
        let params = ["user_id" : "\(currentUserId)",
                      "flatten" : "true"]
        
        NWHConnector().generatePostRequest("job-business-list-active", params, onSuccess: { data, response in
            let decoder = JSONDecoder()
            
            do {
                let results = try decoder.decode([Job].self, from: data)
                self.activeJobs = results
                completion()
                
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                completion()
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completion()
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completion()
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completion()
            } catch {
                print("error decoding data inside getUserJobs")
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
        let params = ["business_user_id" : "\(currentUserId)",
                      "job_status" : "job-status-open",
                      "job_title" : job.title ?? "",
                      "job_description" : job.details ?? "",
                      "target_budget" : job.targetBudget?.filter { numbers.contains($0) } ?? "",
                      "target_date" : job.targetDate ?? "" ] // TODO: FORMAT DATE PASSED INTO SERVICE
        
        NWHConnector().generatePostRequest("job-business-post", params, onSuccess: { data, response in
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
        let params = ["business_user_id" : "\(currentUserId)",
                      "job_status" : "job-status-open",
                      "job_title" : job.title ?? "",
                      "job_description" : job.details ?? "",
                      "target_budget" : job.targetBudget?.filter { numbers.contains($0) } ?? "",
                      "target_date" : formatDateString(from: job.targetDate ?? "") ]
        
        NWHConnector().generatePostRequest("job-business-post", params, onSuccess: { data, response in
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
    
    func formatDateString(from date: String) -> String {
        let formatPost = DateFormatter()
        formatPost.dateFormat = "Y-m-d H:i:s"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        return formatPost.string(from: dateFormatter.date(from: date) ?? Date())
    }
    
}
