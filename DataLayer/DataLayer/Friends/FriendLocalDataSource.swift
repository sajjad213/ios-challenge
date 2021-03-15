//
//  FriendLocalDataSource.swift
//  DataLayer
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation
import Domain

public protocol FriendLocalDataSourceInterface {
    func getCachedFriends(handler: @escaping ([FriendEntity]) -> ())
}
