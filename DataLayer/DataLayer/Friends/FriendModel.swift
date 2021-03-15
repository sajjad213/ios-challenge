//
//  FriendModel.swift
//  DataLayer
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation
import Domain

public struct FriendModel: Codable {
    
    public let id: Int?
    public let phone: String?
    public let avatar: String?
    public let firstName: String?
    public let lastName: String?
    
    public enum CodingKeys: String, CodingKey
    {
        case id
        case phone
        case avatar     = "gender"
        case firstName  = "first_name"
        case lastName   = "last_name"
    }
    
    // DTO: Data Transfer Object
    public func dtoFriendEntity() -> FriendEntity {
        return FriendEntity(id: id, phone: phone, avatar: avatar, firstName: firstName, lastName: lastName)
    }
}
