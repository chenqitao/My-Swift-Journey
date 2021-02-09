//
//  VCloseButtonDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 18.12.20.
//

import SwiftUI
import VComponents

// MARK:- V Close Button Demo View
struct VCloseButtonDemoView: View {
    // MARK: Properties
    static let navBarTitle: String = "Close Button"
    
    @State private var state: VCloseButtonState = .enabled
    @State private var hitBoxType: ButtonComponentHitBoxType = .init(value: VCloseButtonModel.Layout().hitBoxHor)
    
    private var model: VCloseButtonModel {
        let defaultModel: VCloseButtonModel = .init()
        
        var model: VCloseButtonModel = .init()
        
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
extension VCloseButtonDemoView {
    var body: some View {
        VBaseView(title: Self.navBarTitle, content: {
            DemoView(component: component, settings: settings)
        })
    }
    
    private func component() -> some View {
        VCloseButton(model: model, state: state, action: {})
    }
    
    @ViewBuilder private func settings() -> some View {
        VSegmentedPicker(selection: $state, headerTitle: "State")
        
        VSegmentedPicker(selection: $hitBoxType, headerTitle: "Hit Box")
    }
}

// MARK:- Helpers
extension VCloseButtonState: VPickableTitledItem {
    public var pickerTitle: String {
        switch self {
        case .enabled: return "Enabled"
        case .disabled: return "Disabled"
        }
    }
}

// MARK:- Preview
struct VCloseButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VCloseButtonDemoView()
    }
}
