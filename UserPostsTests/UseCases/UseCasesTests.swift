//
//  UseCasesTests.swift
//  UserPostsTests
//
//  Created by Iram Martinez on 02/10/22.
//

import XCTest
@testable import UserPosts

final class UseCasesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getUsersFromRemoteUseCase() {
        let (remoteDS, localDs, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let getUsersFromRemoteUseCase = GetUsersFromRemoteUseCase(usersRepository: repository)
        
        getUsersFromRemoteUseCase.invoke { users, error in
            XCTAssertNil(error)
            XCTAssertNotNil(users)
            XCTAssertTrue(users!.count > 0)
        }
        
        XCTAssertTrue(remoteDS.getUsersCountCalls > 0)
        XCTAssertTrue(remoteDS.getPostsCountCalls == 0)
    }
    
    func test_getPostsOfUserRemoteUseCase() {
        let (remoteDS, localDs, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let getPostsOfUserRemoteUseCase = GetPostsOfUserRemoteUseCase(usersRepository: repository)
        
        getPostsOfUserRemoteUseCase.invoke(userId: 1) { posts, error in
            XCTAssertNil(error)
            XCTAssertNotNil(posts)
            XCTAssertTrue(posts!.count > 0)
        }
        
        XCTAssertTrue(remoteDS.getUsersCountCalls == 0)
        XCTAssertTrue(remoteDS.getPostsCountCalls > 0)
    }
    
    func test_getUsersFromLocalUseCase() {
        let (remoteDS, localDs, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let getUsersFromLocalUseCase = GetUsersFromLocalUseCase(usersRepository: repository)
        
        getUsersFromLocalUseCase.invoke { users, error in
            XCTAssertNil(error)
            XCTAssertNotNil(users)
            XCTAssertTrue(users!.count > 0)
        }
        
        XCTAssertTrue(localDs.getUsersCountCalls > 0)
        XCTAssertTrue(localDs.saveUsersCountCalls == 0)
    }
    
    func test_saveUsersToLocalUseCase() {
        let (remoteDS, localDs, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let saveUsersToLocalUseCase = SaveUsersToLocalUseCase(usersRepository: repository)
        
        XCTAssertTrue(saveUsersToLocalUseCase.invoke([]))
        
        XCTAssertTrue(localDs.getUsersCountCalls == 0)
        XCTAssertTrue(localDs.saveUsersCountCalls > 0)
    }
    
    
    
    func setupFakeDatasourcesAndUsersRepository() -> (remoteDS: UsersURLSDataSourceFake, localDs: UsersLocalDataSourceFake, repository: UsersRepository) {
        let fakeRemoteDataSource = UsersURLSDataSourceFake()
        let fakeLocalDataSource = UsersLocalDataSourceFake()
        let repository = UsersRepository(usersRemoteDataSource: fakeRemoteDataSource, usersLocalDataSource: fakeLocalDataSource)
        return (fakeRemoteDataSource, fakeLocalDataSource, repository)
    }

}
