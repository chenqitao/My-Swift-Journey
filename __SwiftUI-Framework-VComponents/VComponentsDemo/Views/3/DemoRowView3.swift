//
//  DemoRowView3.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 18.12.20.
//

import SwiftUI
import VComponents

// MARK:- Demo Row View
struct DemoRowView3<Content>: View where Content: View {
    // MARK: Properties
    private let rowType: RowType
    enum RowType {
        case untitled
        case titled(_ title: String)
        case controller
        
        var isRow: Bool {
            switch self {
            case .untitled: return true
            case .titled: return true
            case .controller: return false
            }
        }
    }
    
    private let content: () -> Content
    
    // MARK: Initializers
    init(
        type rowType: RowType,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.rowType = rowType
        self.content = content
    }
}

// MARK:- Body
extension DemoRowView3 {
    var body: some View {
        VStack(content: {
            VStack(spacing: 10, content: {
                content()
                
                if case .titled(let title) = rowType {
                    VText(
                        type: .oneLine,
                        font: .footnote,
                        color: ColorBook.secondary,
                        title: title
                    )
                }
            })
                .padding(.vertical, 10)
            
            if rowType.isRow {
                Divider()
            }
        })
    }
}

// MARK:- Preview
struct DemoRowView_Previews: PreviewProvider {
    static var previews: some View {
        DemoRowView3(type: .titled("Lorem ipsum dolor sit amet"), content: {
            Color.pink
                .frame(width: 100, height: 100)
        })
    }
}
