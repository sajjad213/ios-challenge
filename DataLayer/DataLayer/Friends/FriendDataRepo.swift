//
//  FriendDataRepo.swift
//  DataLayer
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation
import Domain


public class FriendDataRepo: FriendDomainRepoInterface {
    
    let friendRemoteDataSource: FriendRemoteDataSourceInterface
    let friendLocalDataSource: FriendLocalDataSourceInterface?
    let coder: Coder
    
    public init(friendRemoteDataSource: FriendRemoteDataSourceInterface,
                friendLocalDataSource: FriendLocalDataSourceInterface? = nil,
                coder: Coder = Coder()) {
        
        self.friendRemoteDataSource = friendRemoteDataSource
        self.friendLocalDataSource = friendLocalDataSource
        
        self.coder = coder
    }
    
    
    public func getFriends(handler: @escaping (Result<[FriendEntity],Error>?) -> ()) {
        
        friendRemoteDataSource.getFriends { (response) in
            
            switch response {
            case .success(let result):
                var friendEntities = [FriendEntity]()
                for friendModel in result {
                    friendEntities.append(friendModel.dtoFriendEntity())
                }
                
                handler(.success(friendEntities))
                
            case .failure(let error):
                handler(.failure(error))
            
            default:
                handler(nil)
            }
        }
    }
}
