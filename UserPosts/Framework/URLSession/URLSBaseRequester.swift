//
//  URLSBaseRequester.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class URLSBaseRequester {
    func baseRequest<T: Codable>(_ endpoint: URLSEndpoints, _ completion: @escaping (T?, RemoteError?) -> Void) {
        let urlStr = "\(URLSConstants.baseURL)\(URLSEndpoints.users.rawValue)"
        let url = URL(string: urlStr)
        
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(nil, .httpError)
                }
                return
            }
            
            let decoder = JSONDecoder()
            if let data = data, let responseObject: T = try? decoder.decode(T.self, from: data) {
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
                
            } else {
                DispatchQueue.main.async {
                    completion(nil, .parsingError)
                }
            }
        }.resume()
    }
    
    func baseRequest<T: Codable>(_ endpoint: URLSEndpoints, _ completion: @escaping ([T]?, RemoteError?) -> Void) {
        let urlStr = "\(URLSConstants.baseURL)\(URLSEndpoints.users.rawValue)"
        let url = URL(string: urlStr)
        
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(nil, .httpError)
                }
                return
            }
            
            let decoder = JSONDecoder()
            if let data = data, let responseObject: [T] = try? decoder.decode([T].self, from: data) {
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
                
            } else {
                DispatchQueue.main.async {
                    completion(nil, .parsingError)
                }
            }
        }.resume()
    }
}
