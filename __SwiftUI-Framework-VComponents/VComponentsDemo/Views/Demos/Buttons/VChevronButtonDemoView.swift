//
//  VChevronButtonDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 18.12.20.
//

import SwiftUI
import VComponents

// MARK:- V Chevron Button Demo View
struct VChevronButtonDemoView: View {
    // MARK: Properties
    static let navBarTitle: String = "Chevron Button"
    
    @State private var state: VChevronButtonState = .enabled
    @State private var direction: VChevronButtonDirection = .left
    @State private var hitBoxType: ButtonComponentHitBoxType = .init(value: VChevronButtonModel.Layout().hitBoxHor)
    
    private var model: VChevronButtonModel {
        let defaultModel: VChevronButtonModel = .init()
        
        var model: VChevronButtonModel = .init()
        
        switch hitBoxType {
        case .clipped:
            model.layout.hitBoxHor = 0
            model.layout.hitBoxVer = 0
            
        case .extended:
            model.layout.hitBoxHor = defaultModel.layout.hitBoxHor.isZero ? 5 : defaultModel.layout.hitBoxHor
            model.layout.hitBoxVer = defaultModel.layout.hitBoxVer.isZero ? 5 : defaultModel.layout.hitBoxVer
        }

        return model
    }
}

// MARK:- Body
extension VChevronButtonDemoView {
    var body: some View {
        VBaseView(title: Self.navBarTitle, content: {
            DemoView(component: component, settings: settings)
        })
    }
    
    private func component() -> some View {
        VChevronButton(model: model, direction: direction, state: state, action: {})
    }
    
    @ViewBuilder private func settings() -> some View {
        VSegmentedPicker(selection: $state, headerTitle: "State")
        
        VSegmentedPicker(selection: $direction, headerTitle: "Direction")
        
        VSegmentedPicker(selection: $hitBoxType, headerTitle: "Hit Box")
    }
}

// MARK:- Helpers
extension VChevronButtonState: VPickableTitledItem {
    public var pickerTitle: String {
        switch self {
        case .enabled: return "Enabled"
        case .disabled: return "Disabled"
        }
    }
}

extension VChevronButtonDirection: VPickableTitledItem {
    public var pickerTitle: String {
        switch self {
        case .up: return "Up"
        case .right: return "Right"
        case .down: return "Down"
        case .left: return "Left"
        }
    }
}

// MARK:- Preview
struct VChevronButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VChevronButtonDemoView()
    }
}
