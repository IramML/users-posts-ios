//
//  URLSBaseRequester.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class URLSBaseRequester {
    func baseRequest<T: Codable>(_ endpoint: URLSEndpoints, paramenters: [String: String]? = nil, completion: @escaping (T?, RemoteError?) -> Void) {
        let parameterString = stringFromHttpParameters(paramenters ?? [:])
        
        
        let urlStr = "\(URLSConstants.baseURL)\(endpoint.rawValue)?\(parameterString)"
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
    
    func baseRequest<T: Codable>(_ endpoint: URLSEndpoints, paramenters: [String: String]? = nil, completion: @escaping ([T]?, RemoteError?) -> Void) {
        let parameterString = stringFromHttpParameters(paramenters ?? [:])
        
        let urlStr = "\(URLSConstants.baseURL)\(endpoint.rawValue)?\(parameterString)"
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
    
    private func stringFromHttpParameters(_ paramenters: [String: String]) -> String {
        let parameterArray = paramenters.map { (key, value) -> String in
            let percentEscapedKey = stringByAddingPercentEncodingForURLQueryValue(key)!
            
            let percentEscapedValue = stringByAddingPercentEncodingForURLQueryValue(value)!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
    
    private func stringByAddingPercentEncodingForURLQueryValue(_ str: String) -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return str.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}
