//
//  NWHConnector.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/22/23.
//

import Foundation

class NWHConnector {
//    let baseURL = "https://app.networkhub.me/wp-json/v1/"
    let baseURL = "http://localhost:8080/"
    
    func generateGetRequest(_ endpoint: String,
                             _ params: [String : String] = [:],
                             onSuccess: @escaping (Data, URLResponse) -> (),
                             onError: @escaping (Error) -> ()) {
        guard var urlComponents = URLComponents(string: baseURL + endpoint) else { return }
        urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents.url else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        print(request.url ?? "")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
                onError(error)
            } else if let data = data, let response = response {
                // Handle HTTP request response
                self.printData(data)
                onSuccess(data, response)
            } else {
                // Handle unexpected error
                print("Unexpected error inside generateGetRequest function")
            }
        }
        
        task.resume()
    }
    
    func generatePostRequest(_ endpoint: String,
                             _ params: [String : String] = [:],
                             onSuccess: @escaping (Data, URLResponse) -> (),
                             onError: @escaping (Error) -> ()) {
        guard var urlComponents = URLComponents(string: baseURL + endpoint) else { return }
        urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        print(request.url ?? "")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
                onError(error)
            } else if let data = data, let response = response {
                // Handle HTTP request response
                self.printData(data)
                onSuccess(data, response)
            } else {
                // Handle unexpected error
                print("Unexpected error inside generatePostRequest function")
            }
        }
        
        task.resume()
    }
    
    private func generateParamString(_ params: [String : String]) -> String {
        var paramsString = "?"
        
        var i = 0
        for param in params {
            paramsString.append(param.key + "=" + param.value)
            if i < (params.count-1) {
                paramsString.append("&")
            }
            i += 1
        }
        
        return paramsString
    }
    
    func printData(_ data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            print(String(decoding: jsonData, as: UTF8.self))
        } else {
            print("json data malformed")
        }
    }
}
	
