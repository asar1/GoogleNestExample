//
//  DeviceService.swift
//  Google Nest
//
//  Created by Muhammad Asar on 2/27/22.
//

import Foundation

class DeviceService {
    
    func getDevices(completion: @escaping (GoogleNest?) -> ()) {
        guard let url = URL(string: "https://smartdevicemanagement.googleapis.com/v1/enterprises/\(projectID)/devices") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(googleUser.authentication.accessToken)", forHTTPHeaderField: "Authorization")
        print("Bearer \(googleUser.authentication.accessToken)")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let orders = try? JSONDecoder().decode(GoogleNest.self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
        
    }
}
