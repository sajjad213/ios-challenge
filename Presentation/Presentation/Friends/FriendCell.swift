//
//  FriendCell.swift
//  Presentation
//
//  Created by Sajjad Khazraei on 3/14/21.
//

import SwiftUI
import Domain

struct FriendCell: View {
    enum FriendType {
        case quickAdd, contact
    }
    
    var type: FriendType
    var friend: FriendEntity
    
    var body: some View {
        HStack {
            HStack {
                RemoteImage(url: friend.avatar ?? "")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(friend.firstName ?? "") \(friend.lastName ?? "")")
                        .font(.headline)
                        .foregroundColor(.mainText)
                    if type == .contact {
                        Text(friend.phone ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondaryText)
                    }
                }
                .frame(height: 44)
            }
            Spacer()
            
            switch type {
            case .quickAdd:
                RoundedButton(icon: Image(systemName: "plus"), title: "Add",
                              backgroundColor: .buttonBackground,
                            foregroundColor: Color.white) {}
                .frame(height: 44)
                
            case .contact:
                RoundedButton(icon: Image(systemName: "plus"), title: "Invite",
                            backgroundColor: Color.clear,
                            foregroundColor: .secondaryText) {}
                .frame(height: 44)
            }
        }
        .padding([.top, .bottom], 16)
        .padding([.leading, .trailing], 8)
        .background(Color.white)
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell(type: .quickAdd, friend: PreviewRepo.friendsDependencies().quickAdds.first!)
    }
}
