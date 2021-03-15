//
//  FriendRemoteDataSource.swift
//  DataLayer
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import Foundation
import Domain


public protocol FriendRemoteDataSourceInterface {
    
    init(urlString: String, coder: Coder, session: URLSession)
    
    func getFriends(handler: @escaping (Result<[FriendModel], Error>?) -> ())
}


public class FriendRemoteDataSource: FriendRemoteDataSourceInterface {
    
    let urlString: String
    let coder: Coder
    let session: URLSession
    
    required public init(urlString: String, coder: Coder = Coder(), session: URLSession = URLSession.shared) {
        self.urlString = urlString
        self.coder = coder
        self.session = session
    }
    
    public func getFriends(handler: @escaping (Result<[FriendModel], Error>?) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return handler(nil)
        }
        
        let task = session.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            
            guard let data = data else {
                return handler(.failure(error!))
            }
            
            guard let friendModels = self?.coder.decode(toType: [FriendModel].self, from: data) else {
                return handler(nil)
            }
            
            handler(.success(friendModels))
        }
        task.resume()
        
    }
}
