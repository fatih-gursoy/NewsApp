//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 21.06.2022.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func fetchData<T:Decodable>(endPoint: EndPoint, completion: @escaping (T) -> Void) 
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
}

extension NetworkManager: NetworkProtocol {
    
    func fetchData<T:Decodable>(endPoint: EndPoint, completion: @escaping (T) -> Void) {

        guard let url = URL(string: endPoint.baseUrl + endPoint.path) else { return }
                
        let request = NSMutableURLRequest(url: url)
        request.allHTTPHeaderFields = endPoint.headers
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            guard let data = data else {return}

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
