//
//  GitHubTopReposTests.swift
//  GitHubTopReposTests
//
//  Created by Gabriel Santiago on 29/05/23.
//

import XCTest
@testable import GitHubTopRepos

final class GitHubTopReposTests: XCTestCase {

    var sut: HomeViewModel!
    var double: DoubleHomeViewDelegate!

    override func setUp() {
        super.setUp()
        sut = HomeViewModel()
        double = DoubleHomeViewDelegate()
        sut.delegate = double
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        double = nil
    }

    func testHomeViewDelegate_plaintext_delegateUpdateHomeViewCalled() throws {

        // given
        let expectedResult = "changed"

        let expectation = XCTestExpectation(description: "delegateUpdateHomeViewCalled")

        // when
        sut.getRepositoriesData(language: "Java") {
            XCTAssertNotNil(self.double.labelTextParam)
            XCTAssertEqual(self.double.labelTextParam, expectedResult)
            expectation.fulfill()
        }
        // then
        wait(for: [expectation])
    }

    func testHomeViewModel_repositoriesArray_GetReporitoriesDataCalled() throws {

        // given

        let expectation = XCTestExpectation(description: "GetRepositoriesDataCalled")

        // when
        sut.getRepositoriesData (language: "Java") {
            XCTAssertNotNil(self.sut.reposList[0])
            expectation.fulfill()
        }

        // then
        wait(for: [expectation])
    }

}
