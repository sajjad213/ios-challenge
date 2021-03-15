//
//  FriendsVM.swift
//  Presentation
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation
import Domain

public class FriendsVM: ObservableObject {
    enum State {
        case loading
        case failed(Error?)
        case loaded
    }
    
    @Published private(set) var state = State.loading
    
    @Published var quickAdds: [FriendEntity] = []
    @Published var friends: [FriendEntity] = []
    
    private var friendInteractor: FriendInteractorInterface
    
    public init(friendInteractor: FriendInteractorInterface) {
        self.friendInteractor = friendInteractor
    }
    
    func getFriends() {
        state = .loading
        
        self.friendInteractor.getFriends { [weak self] (response) in
            switch response {
            case .success(let friendsArray):
                DispatchQueue.main.async {
                    self?.state = .loaded
                    self?.quickAdds = Array(friendsArray[0...4])
                    self?.friends = Array(friendsArray[5...])
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.state = .failed(error)
                }
            default:
                DispatchQueue.main.async {
                    self?.state = .failed(nil)
                }
            }
        }
    }
}
