//
//  AppDI.swift
//  FriendsList
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation
import Presentation


class AppDI: AppDIInterface {
    
    static let shared = AppDI(appEnvironment: AppEnvironment())
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func friendDependencies() -> FriendsVM {
        
        let friendsDI: FriendsDI = FriendsDI(appEnvironment: appEnvironment)
        
        let friendsVM = friendsDI.friendsDependencies()
                
        return friendsVM
    }
    
}
