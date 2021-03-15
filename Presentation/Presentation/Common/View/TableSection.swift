//
//  TableSection.swift
//  Presentation
//
//  Created by Sajjad Khazraei on 3/14/21.
//

import SwiftUI

struct TableSection<Header, Content>: View where Header : View, Content : View {
    let header: Header
    let content: () -> Content
    
    init(header: Header, @ViewBuilder content: @escaping () -> Content) {
        self.header = header
        self.content = content
    }

    var body: some View {
        VStack {
            self.header
            VStack(spacing: 0) {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.sectionBackground)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
            .padding([.leading, .trailing], 16)
        }
    }
}

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        ZStack {
            Divider().padding(8)
            Text(title)
                .foregroundColor(Color.mainText)
                .padding(8)
                .background(Color.tableBackground)
        }
    }
}
