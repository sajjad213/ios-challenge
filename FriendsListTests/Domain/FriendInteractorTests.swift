//
//  FriendInteractorTests.swift
//  DomainTests
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import XCTest
@testable import Domain

class FriendInteractorTests: XCTestCase {
    
    var sut: FriendInteractorInterface!

    override func setUpWithError() throws {
        sut = FriendInteractor(friendDomainRepo: Repo())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetFriends() throws {
        sut.getFriends { (response) in
            let friends = try? response?.get()
            XCTAssertEqual(friends?.count, 2)
            XCTAssertEqual(friends?.first?.id, 1)
            XCTAssertEqual(friends?.first?.phone, "09999999999")
            XCTAssertEqual(friends?.first?.avatar, "avatar1")
            XCTAssertEqual(friends?.first?.firstName, "name1")
            XCTAssertEqual(friends?.first?.lastName, "last1")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

struct Repo: FriendDomainRepoInterface {
    func getFriends(handler: @escaping (Result<[FriendEntity], Error>?) -> ()) {
        let friend1 = FriendEntity(id: 1, phone: "09999999999", avatar: "avatar1", firstName: "name1", lastName: "last1")
        let friend2 = FriendEntity(id: 2, phone: "09999999998", avatar: "avatar2", firstName: "name2", lastName: "last2")
        
        handler(.success([friend1, friend2]))
    }
}
