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
    
    func updateUserJobs(completion: @escaping () -> ()) {
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
    
}
