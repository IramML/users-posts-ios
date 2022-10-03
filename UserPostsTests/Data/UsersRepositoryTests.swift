//
//  UsersRepositoryTests.swift
//  UserPostsTests
//
//  Created by Iram Martinez on 02/10/22.
//

import XCTest
@testable import UserPosts

final class UsersRepositoryTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getRemoteUsersFromRepository() {
        let (remoteDS, _, repository) = setupFakeDatasourcesAndRepository()
        
        repository.getUsersFromRemote { users, error in
            XCTAssertNil(error)
            XCTAssertNotNil(users)
            XCTAssertTrue(users!.count > 0)
        }
        
        XCTAssertTrue(remoteDS.getUsersCountCalls > 0)
        XCTAssertTrue(remoteDS.getPostsCountCalls == 0)
    }
    
    func test_getRemotePostsFromRepository() {
        let (remoteDS, _, repository) = setupFakeDatasourcesAndRepository()
        
        repository.getRemoteUserPostsBy(userId: 1) { posts, error in
            XCTAssertNil(error)
            XCTAssertNotNil(posts)
            XCTAssertTrue(posts!.count > 0)
        }
        
        XCTAssertTrue(remoteDS.getUsersCountCalls == 0)
        XCTAssertTrue(remoteDS.getPostsCountCalls > 0)
    }
    
    
    func test_getUsersFromLocal() {
        let (_, localDS, repository) = setupFakeDatasourcesAndRepository()
        
        repository.getUsersFromLocal { users, error in
            XCTAssertNil(error)
            XCTAssertNotNil(users)
            XCTAssertTrue(users!.count > 0)
        }
        
        XCTAssertTrue(localDS.getUsersCountCalls > 0)
        XCTAssertTrue(localDS.saveUsersCountCalls == 0)
    }
    
    func test_saveUsersInLocal() {
        let (_, localDS, repository) = setupFakeDatasourcesAndRepository()
        
        XCTAssertTrue(repository.saveUsersToLocal([]))
        
        XCTAssertTrue(localDS.getUsersCountCalls == 0)
        XCTAssertTrue(localDS.saveUsersCountCalls > 0)
    }
    
    func setupFakeDatasourcesAndRepository() -> (remoteDS: UsersURLSDataSourceFake, localDs: UsersLocalDataSourceFake, repository: UsersRepository) {
        let fakeRemoteDataSource = UsersURLSDataSourceFake()
        let fakeLocalDataSource = UsersLocalDataSourceFake()
        let repository = UsersRepository(usersRemoteDataSource: fakeRemoteDataSource, usersLocalDataSource: fakeLocalDataSource)
        return (fakeRemoteDataSource, fakeLocalDataSource, repository)
    }

}
