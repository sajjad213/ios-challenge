//
//  FriendDomainRepoInterface.swift
//  Domain
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation


public protocol FriendDomainRepoInterface {
    
    func getFriends(handler: @escaping (Result<[FriendEntity],Error>?) -> ())
}
