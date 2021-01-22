//
//  Styles.swift
//  buttoncraft
//
//  Created by An Trinh on 23/9/20.
//

import SwiftUI

struct ButtonStyleParams {
    let scale: Double
    let rotation: Double
    let blur: Double
    let color: Color
    let animate: Bool
    let response: Double
    let damping: Double
    let duration: Double
}

struct TestButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.body.bold())
            .imageScale(.large)
            .padding()
            .foregroundColor(Color.primary)
            .colorInvert()
    }
}

struct ButtonPressedStyle: ButtonStyle {
    var style: ButtonStyleParams
    var drawBackground: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Capsule()
                            .foregroundColor(configuration.isPressed ? Color(.sRGB, red: style.color.components.red, green: style.color.components.green, blue: style.color.components.blue, opacity: style.color.components.opacity) : Color.primary)
                            .opacity(drawBackground ? 1 : 0))
            .scaleEffect(configuration.isPressed ? CGFloat(style.scale) : 1.0)
            .rotationEffect(.degrees(configuration.isPressed ? style.rotation : 0))
            .blur(radius: configuration.isPressed ? CGFloat(style.blur) : 0)
            .animation(style.animate ? Animation.spring(response: style.response, dampingFraction: style.damping, blendDuration: style.duration) : .none)
    }
}

struct PaddedStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .accentColor(DEFAULT_COLOR)
            .padding(.vertical)
            .padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(Color(UIColor.secondarySystemBackground)))
            .padding(.horizontal)
    }
}
