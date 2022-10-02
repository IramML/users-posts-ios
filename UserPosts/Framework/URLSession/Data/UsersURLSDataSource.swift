//
//  UsersURLSDataSource.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class UsersURSDataSource: URLSBaseRequester, UsersRemoteDataSource {
    
    func getUsers(_ completion: @escaping ([User]?, RemoteError?) -> Void) {
        self.baseRequest(.users) { (result: [User]?, error: RemoteError?) in
            if let error = error {
                completion(nil, error)
            }
            if let result = result {
                completion(result, nil)
            }
        }
    }
    
}
