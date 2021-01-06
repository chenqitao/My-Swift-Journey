//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Brian Sipple on 10/15/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .bannerFont()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
