//
//  UsersURLSDataSourceTest.swift
//  UserPostsTests
//
//  Created by Iram Martinez on 02/10/22.
//

import XCTest
@testable import UserPosts

final class UsersURLSDataSourceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getUsers() {
        let usersDataSource = UsersURLSDataSourceSpy()
        
        usersDataSource.getUsers { users, error in
            XCTAssertNotNil(users)
            XCTAssertNil(error)
            guard let users = users else {
                if let error = error {
                    switch error {
                    case .parsingError:
                        fatalError("Parsing error")
                    case .httpError:
                        fatalError("HTTP error")
                    }
                } else {
                    fatalError("Unspected error")
                }
            }
            
            
            XCTAssertTrue(users.count > 0)
        }
        
        XCTAssertTrue(usersDataSource.getUsersCountCalls > 0)
    }
    
    func test_getPosts() {
        let usersDataSource = UsersURLSDataSourceSpy()
        
        usersDataSource.getPostsOfUser(userId: 1) { posts, error in
            XCTAssertNotNil(posts)
            XCTAssertNil(error)
            guard let posts = posts else {
                if let error = error {
                    switch error {
                    case .parsingError:
                        fatalError("Parsing error")
                    case .httpError:
                        fatalError("HTTP error")
                    }
                } else {
                    fatalError("Unspected error")
                }
            }
            
            
            XCTAssertTrue(posts.count > 0)
        }
        
        XCTAssertTrue(usersDataSource.getPostsCountCalls > 0)
    }
    

}

class UsersURLSDataSourceSpy: UsersURLSDataSource {
    var getUsersCountCalls: Int = 0
    var getPostsCountCalls: Int = 0
    
    override func getUsers(_ completion: @escaping ([UserPosts.User]?, UserPosts.RemoteError?) -> Void) {
        getUsersCountCalls += 1
        super.getUsers(completion)
    }
    
    override func getPostsOfUser(userId: Int, _ completion: @escaping ([UserPosts.UserPost]?, UserPosts.RemoteError?) -> Void) {
        getPostsCountCalls += 1
        super.getPostsOfUser(userId: userId, completion)
    }
}

class UsersURLSDataSourceFake: UsersRemoteDataSource {
    var getUsersCountCalls: Int = 0
    var getPostsCountCalls: Int = 0
    
    func getUsers(_ completion: @escaping ([UserPosts.User]?, UserPosts.RemoteError?) -> Void) {
        getUsersCountCalls += 1
        let user1 = User(id: 1, name: "", username: "", email: "", phone: "")
        var user2 = user1
        user2.id = 2
        completion([user1, user2], nil)
    }
    
    func getPostsOfUser(userId: Int, _ completion: @escaping ([UserPosts.UserPost]?, UserPosts.RemoteError?) -> Void) {
        getPostsCountCalls += 1
        let post1 = UserPost(userId: 1, id: 1, title: "", body: "")
        let post2 = UserPost(userId: 2, id: 2, title: "", body: "")
        completion([post1, post2], nil)
    }
    
    
}



class UsersLocalDataSourceFake: UsersLocalDataSource {
    var getUsersCountCalls: Int = 0
    var saveUsersCountCalls: Int = 0
    
    func getUsers(_ completion: @escaping ([UserPosts.User], UserPosts.LocalError?) -> Void) {
        getUsersCountCalls += 1
        let user1 = User(id: 1, name: "", username: "", email: "", phone: "")
        var user2 = user1
        user2.id = 2
        completion([user1, user2], nil)
    }
    
    func saveUsers(_ users: [UserPosts.User]) -> Bool {
        saveUsersCountCalls += 1
        return true
    }
    
    
}
