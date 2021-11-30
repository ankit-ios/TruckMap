//
//  NetworkManager.swift
//  TruckMap
//
//  Created by Ankit Sharma on 26/12/21.
//

import Foundation

struct NetworkManager {
    
    private static func request<T: Codable>(api: URL, completion: @escaping Completion<T>) {
        
        URLSession.shared.dataTask(with: api) { (data, respnse, error) in
            guard let data = data else {
                completion(nil, NetworkError.unKnown)
                return
            }
            
            do {
                let decoder = try JSONDecoder().decode(T.self, from: data)
                completion(decoder, nil)
            }
            catch {
                print(error)
                completion(nil, error)
            }
        }.resume()
    }
}

extension NetworkManager {
    
    static func fetchAllTruckDetails(completion: @escaping Completion<[Truck]>) {
        request(api: URL(string: kBaseURL)!) { (response: APIResponse?, error) in
            if let trucks = response?.data {
                completion(trucks, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
