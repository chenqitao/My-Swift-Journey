//
//  ContentView.swift
//  DynamicTypeSizesPreview
//
//  Created by Edgar Nzokwe on 3/29/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ArticleView(article: sampleArticle2)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .environment(\.sizeCategory, .extraSmall)
            ContentView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }.previewLayout(.sizeThatFits)
    }
}
