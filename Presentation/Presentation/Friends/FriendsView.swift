//
//  FriendsView.swift
//  Presentation
//
//  Created by Sajjad Khazraei on 3/13/21.
//

import SwiftUI
import Domain

public struct FriendsView: View {
//    var appDI: AppDIInterface
    @ObservedObject var friendsVM: FriendsVM
        
    public init(/*appDI: AppDIInterface, */friendsVM: FriendsVM) {
//        self.appDI = appDI
        self.friendsVM = friendsVM
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : Color.mainText.uiColor()
        ]
        UINavigationBar.appearance().tintColor = Color.mainText.uiColor()
    }
    
    public var body: some View {
        VStack {
            NavigationView {
                GeometryReader { geometry in
                ScrollView {
                    switch friendsVM.state {
                    case .loaded:
                        if friendsVM.quickAdds.count > 0 {
                            TableSection(header:
                                            SectionHeader(title: "Quick Add")
                                            .padding(.top, 8)
                            ) {
                                ForEach(Array(friendsVM.quickAdds.enumerated()), id: \.offset) { (index, friend) in
                                    ListCell(type: .quickAdd, friend: friend, hasSeparator: index != friendsVM.quickAdds.count - 1)
                                }
                            }
                        }
                        
                        if friendsVM.friends.count > 0 {
                            TableSection(header:
                                            SectionHeader(title: "In Your Contacts")
                                            .padding(.top, 8)
                            ) {
                                List {
                                    ForEach(Array(friendsVM.friends.enumerated()), id: \.offset) { (index, friend) in
                                        ListCell(type: .contact, friend: friend, hasSeparator: index != friendsVM.friends.count - 1)
                                        .listRowInsets(EdgeInsets())
                                        .background(Color.white)
                                    }
                                }
                                .frame(height: 76.5 * CGFloat(friendsVM.friends.count))
                            }
                        }
                        
                        Spacer()
                        
                    case .loading:
                        VStack {
                            ActivityIndicator(isAnimating: .constant(true), style: .large)
                        }
                        .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                        
                    case .failed(let error):
                        Text(error?.localizedDescription ?? "")
                    }
                }
                .background(Color.tableBackground)
                .navigationBarTitle("Your Friends", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {}) {
                    Image(systemName: "arrow.left").imageScale(.large)
                }, trailing: Button(action: {}) {
                    Image(systemName: "magnifyingglass").imageScale(.large)
                })
                }
            }
            .cornerRadius(10)
        }
        .padding(8)
        .background(Color.mainBackground.edgesIgnoringSafeArea(.top))
        
        .onAppear {
            self.friendsVM.getFriends()
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(friendsVM: PreviewRepo.friendsDependencies())
    }
}

struct ListCell: View {
    let type: FriendCell.FriendType
    let friend: FriendEntity
    let hasSeparator: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            FriendCell(type: type, friend: friend)
                .frame(minWidth: 0, maxWidth: .infinity)
            
            if hasSeparator {
                Color.separator
                    .frame(height: 0.5)
                    .background(Color.separator)
            }
        }
    }
}
