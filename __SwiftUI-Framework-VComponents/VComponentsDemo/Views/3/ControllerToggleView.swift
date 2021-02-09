//
//  ControllerToggleView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI
import VComponents

// MARK:- Controller Toggle View
struct ControllerToggleView: View {
    // MARK: Properties
    @Binding var isOn: VToggleState
    private let title: String
    
    // MARK: Initializers
    init(state: Binding<Bool>, title: String) {
        self._isOn = .init(bool: state)
        self.title = title
    }
}

// MARK:- Body
extension ControllerToggleView {
    var body: some View {
        VStack(content: {
            VToggle(state: $isOn)
            
            VText(
                type: .oneLine,
                font: .footnote,
                color: ColorBook.primary,
                title: title
            )
        })
    }
}

// MARK:- Preview
struct ControllerToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ControllerToggleView(state: .constant(true), title: "Lorem ipsum dolor sit amet")
    }
}
