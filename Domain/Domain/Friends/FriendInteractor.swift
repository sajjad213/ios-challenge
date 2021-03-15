//
//  FriendInteractor.swift
//  Domain
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation


public protocol FriendInteractorInterface {
        
    func getFriends(handler: @escaping (Result<[FriendEntity],Error>?) -> ())
    
}

public class FriendInteractor: FriendInteractorInterface {
        
    let friendDomainRepo: FriendDomainRepoInterface
    
    public init(friendDomainRepo: FriendDomainRepoInterface) {
        self.friendDomainRepo = friendDomainRepo
    }
    
    
    public func getFriends(handler: @escaping (Result<[FriendEntity],Error>?) -> ()) {
        
        friendDomainRepo.getFriends { (FriendDomainModelArray) in
            handler(FriendDomainModelArray)
        }
    }
}
