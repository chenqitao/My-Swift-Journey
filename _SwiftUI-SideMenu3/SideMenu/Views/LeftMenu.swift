//
//  LeftMenu.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct LeftMenu: View {
    @Environment(\.sideMenuGestureModeKey) var sideMenuGestureMode
    @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    @Environment(\.sideMenuCenterViewKey) var sideMenuCenterView

    var body: some View {
        let text: String;
        
        if self.sideMenuGestureMode.wrappedValue == SideMenuGestureMode.inactive {
            text = "Enable panel gesture"
        } else {
            text = "Disable panel gesture"
        }
        
        return GeometryReader { geometry in
            VStack(spacing: 10) {
                Text("Hello World!")
                Button(action: {
                    withAnimation {
                        self.sideMenuCenterView.wrappedValue = AnyView(PhotosView(orderBy: .popular))
                        self.sideMenuLeftPanel.wrappedValue = false
                    }
                }, label: {
                    Text("Show Popular Photos")
                })
                Button(action: {
                    withAnimation {
                        if self.sideMenuGestureMode.wrappedValue == SideMenuGestureMode.inactive {
                            self.sideMenuGestureMode.wrappedValue = SideMenuGestureMode.active
                        } else {
                            self.sideMenuGestureMode.wrappedValue = SideMenuGestureMode.inactive
                        }
                    }
                }, label: {
                    Text(text)
                })
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .foregroundColor(.black)
            .background(Color.blue)
            .background(Rectangle().shadow(radius: 4))
        }
    }
}

#if DEBUG
struct LeftMenu_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LeftMenu()
        }
    }
}
#endif
