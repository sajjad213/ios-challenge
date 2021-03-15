//
//  PreviewRepo.swift
//  Presentation
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation
import Domain

struct PreviewRepo {
    
    static func friendsDependencies() -> FriendsVM {
        let interactor = Interactor()
        let friendsVM = FriendsVM(friendInteractor: interactor)
        friendsVM.quickAdds = Array(interactor.mockedFriends[0...4])
        friendsVM.friends = Array(interactor.mockedFriends[5...])
        return friendsVM
    }
    
}

struct Interactor: FriendInteractorInterface {
    let mockedFriends = [
        FriendEntity(id: 1, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Sajjad", lastName: "Khazraei"),
        FriendEntity(id: 2, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Cairistiona", lastName: "Auston"),
        FriendEntity(id: 3, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Lonni", lastName: "Dedden"),
        FriendEntity(id: 4, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Otto", lastName: "Kamall"),
        FriendEntity(id: 5, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Nathalie", lastName: "Twinning"),
        FriendEntity(id: 6, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Ofella", lastName: "Pallesen"),
        FriendEntity(id: 7, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Orton", lastName: "Gillard"),
        FriendEntity(id: 8, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Levin", lastName: "Humbatch"),
        FriendEntity(id: 9, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Pris", lastName: "McDonand"),
        FriendEntity(id: 10, phone: "0999999999", avatar: "https://dummyimage.com/141x143.bmp/cc0000/ffffff", firstName: "Ericka", lastName: "Hearfield")
    ]
    
    func getFriends(handler: @escaping (Result<[FriendEntity],Error>?) -> ()) {
        handler(.success(mockedFriends))
    }
}
