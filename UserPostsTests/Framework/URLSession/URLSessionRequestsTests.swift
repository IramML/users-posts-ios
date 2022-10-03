//
//  URLSessionRequestsTests.swift
//  UserPostsTests
//
//  Created by Iram Martinez on 02/10/22.
//

import XCTest
@testable import UserPosts

final class URLSessionRequestsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUsersEndpointURL() {
        let baseURL = URLSConstants.baseURL
        
        XCTAssertEqual("\(baseURL)", "https://jsonplaceholder.typicode.com")
        XCTAssertEqual("\(baseURL)\(URLSEndpoints.users.rawValue)", "https://jsonplaceholder.typicode.com/users")
    }
    
    func testPostsEndpointURL() {
        let baseURL = URLSConstants.baseURL
        
        XCTAssertEqual("\(baseURL)", "https://jsonplaceholder.typicode.com")
        XCTAssertEqual("\(baseURL)\(URLSEndpoints.posts.rawValue)", "https://jsonplaceholder.typicode.com/posts")
    }
    
}
