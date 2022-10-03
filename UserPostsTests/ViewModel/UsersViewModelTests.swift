//
//  UsersViewModelTests.swift
//  UserPostsTests
//
//  Created by Iram Martinez on 02/10/22.
//

import XCTest
@testable import UserPosts

final class UsersViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_getUsersStoredOnLocal() {
        let (remoteDS, localDs, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let getUsersFromRemoteUseCase = GetUsersFromRemoteUseCase(usersRepository: repository)
        let getUsersFromLocalUseCase = GetUsersFromLocalUseCase(usersRepository: repository)
        let saveUsersToLocalUseCase = SaveUsersToLocalUseCase(usersRepository: repository)
        
        let usersViewModel = UsersViewModel(
            getUsersFromRemoteUseCase: getUsersFromRemoteUseCase,
            getUsersFromLocalUseCase: getUsersFromLocalUseCase,
            saveUsersToLocalUseCase: saveUsersToLocalUseCase
        )
        
        usersViewModel.fetchData()
        
        XCTAssertTrue(usersViewModel.items.count == 3)
        XCTAssertTrue(remoteDS.getUsersCountCalls == 0)
        XCTAssertTrue(localDs.getUsersCountCalls > 0)
        XCTAssertTrue(localDs.saveUsersCountCalls == 0)
    }
    
    func test_whenLocalUsersAreEmptyShouldGetRemoteUsers() {
        let (remoteDS, localDs, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let getUsersFromRemoteUseCase = GetUsersFromRemoteUseCase(usersRepository: repository)
        let getUsersFromLocalUseCase = GetUsersFromLocalUseCase(usersRepository: repository)
        let saveUsersToLocalUseCase = SaveUsersToLocalUseCase(usersRepository: repository)
        
        let usersViewModel = UsersViewModel(
            getUsersFromRemoteUseCase: getUsersFromRemoteUseCase,
            getUsersFromLocalUseCase: getUsersFromLocalUseCase,
            saveUsersToLocalUseCase: saveUsersToLocalUseCase
        )
        
        localDs.shouldReturnEmptyUsers = true
        usersViewModel.fetchData()
        
        XCTAssertTrue(usersViewModel.items.count == 2)
        XCTAssertTrue(remoteDS.getUsersCountCalls > 0)
        XCTAssertTrue(localDs.getUsersCountCalls > 0)
    }
    
    func test_whenRemoteUsersAreFetchedSaveToLocal() {
        let (_, localDs, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let getUsersFromRemoteUseCase = GetUsersFromRemoteUseCase(usersRepository: repository)
        let getUsersFromLocalUseCase = GetUsersFromLocalUseCase(usersRepository: repository)
        let saveUsersToLocalUseCase = SaveUsersToLocalUseCase(usersRepository: repository)
        
        let usersViewModel = UsersViewModel(
            getUsersFromRemoteUseCase: getUsersFromRemoteUseCase,
            getUsersFromLocalUseCase: getUsersFromLocalUseCase,
            saveUsersToLocalUseCase: saveUsersToLocalUseCase
        )
        
        localDs.shouldReturnEmptyUsers = true
        usersViewModel.fetchData()
        XCTAssertTrue(localDs.saveUsersCountCalls > 0)
    }
    

    func setupFakeDatasourcesAndUsersRepository() -> (remoteDS: UsersURLSDataSourceFake, localDs: UsersLocalDataSourceFake, repository: UsersRepository) {
        let fakeRemoteDataSource = UsersURLSDataSourceFake()
        let fakeLocalDataSource = UsersLocalDataSourceFake()
        let repository = UsersRepository(usersRemoteDataSource: fakeRemoteDataSource, usersLocalDataSource: fakeLocalDataSource)
        return (fakeRemoteDataSource, fakeLocalDataSource, repository)
    }
}
