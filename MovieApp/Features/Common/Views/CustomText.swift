//
//  Text.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

enum TextType {
    case bold, light, regular, medium
}

struct CustomText: ViewModifier {
    var size: CGFloat
    var type: TextType
    
    func font() -> String {
        switch type {
        case .bold:
            return "Poppins-Bold"
        case .light:
            return "Poppins-Light"
        case .regular:
            return "Poppins-Regular"
        case .medium:
            return "Poppins-Medium"
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(font(), size: size))
    }
}

extension View {
    func customTextStyle(size: CGFloat, type: TextType) -> some View {
        modifier(CustomText(size: size, type: type))
    }
}
