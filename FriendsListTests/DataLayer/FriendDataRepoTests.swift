//
//  FriendDataRepoTests.swift
//  DataLayerTests
//
//  Created by Sajjad Khazraei on 3/14/21.
//

import XCTest
@testable import DataLayer

class FriendDataRepoTests: XCTestCase {
    
    var sut: FriendDataRepo!

    override func setUpWithError() throws {
        super.setUp()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        let remote = FriendRemoteDataSource(urlString: "https://api.mocki.io/v1/5ba64d6e", session: urlSession)
        sut = FriendDataRepo(friendRemoteDataSource: remote)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetFriends() throws {
        let url = Bundle(for: Self.self).url(forResource: "friends", withExtension: "json")
        let jsonData = try Data(contentsOf: url!)
            
        MockURLProtocol.requestHandler = { request in
          let response = HTTPURLResponse(url: URL(string: "https://api.mocki.io/v1/5ba64d6e")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
          return (response, jsonData)
        }
        
        sut.getFriends { (response) in
            let friends = try? response?.get()
            XCTAssertEqual(friends?.count, 5)
            XCTAssertEqual(friends?.first?.id, 1)
            XCTAssertEqual(friends?.first?.phone, "812-799-5231")
            XCTAssertEqual(friends?.first?.avatar, "http://dummyimage.com/166x141.png/dddddd/000000")
            XCTAssertEqual(friends?.first?.firstName, "Cairistiona")
            XCTAssertEqual(friends?.first?.lastName, "Auston")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
