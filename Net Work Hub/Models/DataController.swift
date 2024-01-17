//
//  DataController.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/22/23.
//

import Foundation

@MainActor class DataController: ObservableObject {
    
    @Published var currentUserId = Int()
    @Published var activeJobs = [Job]()
//    @Published var completedJobs = [Job]()
    
    let numbers = "01234567890"
    
    func deleteUserJob(jobId: String, completion: @escaping () -> ()) {
        let params = ["job_id" : jobId]
        NWHConnector().generatePostRequest("job-business-remove", onSuccess: { data, response in
            if let response = response as? HTTPURLResponse {
                guard (200 ... 299) ~= response.statusCode else { // check for http errors
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    completion()
                    return
                }
                
                self.activeJobs.removeAll(where: {$0.jobDetail_Id_PK == jobId})
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
            } catch {
                print("error decoding data inside updateUserJobs")
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
                      "job_title" : job.jobDetail_Title ?? "",
                      "job_description" : job.jobDetail_Description ?? "",
                      "target_budget" : job.jobDetail_Proposal_Target_Budget?.filter { numbers.contains($0) } ?? "",
                      "target_date" : job.jobDetail_Proposal_Target_Date ?? "" ] // TODO: FORMAT DATE PASSED INTO SERVICE
        
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
                      "job_title" : job.jobDetail_Title ?? "",
                      "job_description" : job.jobDetail_Description ?? "",
                      "target_budget" : job.jobDetail_Proposal_Target_Budget?.filter { numbers.contains($0) } ?? "",
                      "target_date" : job.jobDetail_Proposal_Target_Date ?? "" ] // TODO: FORMAT DATE PASSED INTO SERVICE
        
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
    
}
