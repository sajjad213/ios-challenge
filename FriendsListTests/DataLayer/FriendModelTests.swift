//
//  FriendModelTests.swift
//  DataLayerTests
//
//  Created by Sajjad Khazraei on 3/14/21.
//

import XCTest
@testable import DataLayer

class FriendModelTests: XCTestCase {
    
    var sut: FriendModel!

    override func setUpWithError() throws {
        sut = FriendModel(id: 1, phone: "09999999999", avatar: "avatar", firstName: "name", lastName: "last")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoding() throws {
        let url = Bundle(for: Self.self).url(forResource: "friend", withExtension: "json")
        let jsonData = try Data(contentsOf: url!)
        XCTAssertNoThrow(try JSONDecoder().decode(FriendModel.self, from: jsonData))
    }
    
    func testDTOEntity() throws {
        let friendEntity = sut.dtoFriendEntity()
        XCTAssertEqual(friendEntity.id, 1)
        XCTAssertEqual(friendEntity.phone, "09999999999")
        XCTAssertEqual(friendEntity.avatar, "avatar")
        XCTAssertEqual(friendEntity.firstName, "name")
        XCTAssertEqual(friendEntity.lastName, "last")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
