//
//  PostsViewModelTests.swift
//  UserPostsTests
//
//  Created by Iram Martinez on 02/10/22.
//

import XCTest
@testable import UserPosts

final class PostsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_whenRemoteUsersAreFetchedSaveToLocal() {
        let (remoteDS, _, repository) = self.setupFakeDatasourcesAndUsersRepository()
        let getPostsOfUserRemoteUseCase = GetPostsOfUserRemoteUseCase(usersRepository: repository)
        
        let postsViewModel = PostsViewModel(getPostsOfUserRemoteUseCase: getPostsOfUserRemoteUseCase)
        
        postsViewModel.fetchUserPostsBy(userId: 1)
        
        XCTAssertTrue(postsViewModel.posts.count > 0)
        XCTAssertTrue(remoteDS.getPostsCountCalls > 0)
        XCTAssertTrue(remoteDS.getUsersCountCalls == 0)
    }
    

    func setupFakeDatasourcesAndUsersRepository() -> (remoteDS: UsersURLSDataSourceFake, localDs: UsersLocalDataSourceFake, repository: UsersRepository) {
        let fakeRemoteDataSource = UsersURLSDataSourceFake()
        let fakeLocalDataSource = UsersLocalDataSourceFake()
        let repository = UsersRepository(usersRemoteDataSource: fakeRemoteDataSource, usersLocalDataSource: fakeLocalDataSource)
        return (fakeRemoteDataSource, fakeLocalDataSource, repository)
    }

}
