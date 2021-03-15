//
//  RoundedButton.swift
//  Presentation
//
//  Created by Sajjad Khazraei on 3/14/21.
//

import SwiftUI

struct RoundedButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 0
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let icon: Image?
    private let title: String
    private let action: () -> Void
    
    private let disabled: Bool
    
    init(icon: Image? = nil, title: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.blue,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.icon = icon
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        HStack {
            Button(action:self.action) {
                HStack(spacing: 2) {
                    self.icon
                    Text(self.title)
                }
                .frame(maxHeight:.infinity)
            }
            .buttonStyle(RoundedButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled))
                .disabled(self.disabled)
        }
    }
}

struct RoundedButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding([.leading, .trailing])
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            .cornerRadius(1000)
            .overlay(
                RoundedRectangle(cornerRadius: 1000)
                    .stroke(currentForegroundColor, lineWidth: 1)
            )
            .font(.headline)
    }
}
