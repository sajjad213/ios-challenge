//
//  FriendEntity.swift
//  Domain
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation


public struct FriendEntity: Identifiable {
    
    public let id: Int?
    public let phone: String?
    public let avatar: String?
    public let firstName: String?
    public let lastName: String?
    
    public init(id: Int?, phone: String?, avatar: String?, firstName: String?, lastName: String?) {
        self.id = id
        self.phone = phone
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
    }
}
