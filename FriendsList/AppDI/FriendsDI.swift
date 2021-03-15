//
//  FriendsDI.swift
//  FriendsList
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Presentation
import Domain
import DataLayer


class FriendsDI {
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func friendsDependencies() -> FriendsVM {
        
        // Data Layer
        let baseURL = appEnvironment.baseURL
        
        // Friend Data Source
        let friendRemoteDataSource = FriendRemoteDataSource(urlString: baseURL)
        
        // Friend Data Repo
        let friendDataRepo = FriendDataRepo(friendRemoteDataSource: friendRemoteDataSource)
        
        // Domain Layer
        let friendInteractor = FriendInteractor(friendDomainRepo: friendDataRepo)
        
        // Presentation
        let friendsVM = FriendsVM(friendInteractor: friendInteractor)
        
        return friendsVM
    }
}
