//
//  VSecondaryButtonModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/24/20.
//

import SwiftUI

// MARK:- V Secondary Button Model
/// Model that describes UI
public struct VSecondaryButtonModel {
    public var layout: Layout = .init()
    public var colors: Colors = .init()
    public var fonts: Fonts = .init()
    
    public init() {}
}

// MARK:- Layout
extension VSecondaryButtonModel {
    public struct Layout {
        public var height: CGFloat = 32
        var cornerRadius: CGFloat { height / 2 }
        
        public var borderWidth: CGFloat = 0
        var hasBorder: Bool { borderWidth > 0 }
        
        public var contentMarginHor: CGFloat = 10
        public var contentMarginVer: CGFloat = 3
        
        public var hitBoxHor: CGFloat = 0
        public var hitBoxVer: CGFloat = 0
        
        public init() {}
    }
}

// MARK:- Colors
extension VSecondaryButtonModel {
    public struct Colors {
        public var content: StateOpacities = .init(
            pressedOpacity: 0.5,
            disabledOpacity: 0.5
        )
        
        public var textContent: StateColors = .init(   // Only applicable during init with title
            enabled: primaryButtonReference.colors.textContent.enabled,
            pressed: primaryButtonReference.colors.textContent.pressed,
            disabled: primaryButtonReference.colors.textContent.disabled
        )
        
        public var background: StateColors = .init(
            enabled: primaryButtonReference.colors.background.enabled,
            pressed: primaryButtonReference.colors.background.pressed,
            disabled: primaryButtonReference.colors.background.disabled
        )
        
        public var border: StateColors = .init(
            enabled: primaryButtonReference.colors.border.enabled,
            pressed: primaryButtonReference.colors.border.pressed,
            disabled: primaryButtonReference.colors.border.disabled
        )
        
        public init() { }
    }
}

extension VSecondaryButtonModel.Colors {
    public typealias StateColors = StateColorsEPD
    
    public typealias StateOpacities = StateOpacitiesPD
}

// MARK:- Fonts
extension VSecondaryButtonModel {
    public struct Fonts {
        public var title: Font = primaryButtonReference.fonts.title   // Only applicable during init with title
        
        public init() {}
    }
}

// MARK:- References
extension VSecondaryButtonModel {
    public static let primaryButtonReference: VPrimaryButtonModel = .init()
}
