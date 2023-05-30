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
        var expectedResult = "changed"

        let expectation = XCTestExpectation(description: "delegateUpdateHomeViewCalled")

        // when
        sut.getRepositoriesData(language: "Java") {
            XCTAssertNotNil(self.double.labelTextParam)
            expectation.fulfill()
        }

        // then


        wait(for: [expectation])

    }


}
