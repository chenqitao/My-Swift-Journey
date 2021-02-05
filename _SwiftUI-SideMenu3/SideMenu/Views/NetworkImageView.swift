//
//  NetworksImageView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 14/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct NetworkImageView: View {
    
    @ObservedObject var photoLoaderViewModel: PhotoLoaderViewModel
    
    let urlString: String?
    let shouldShimmer: Bool
    
    var body: some View {
        self.containedView()
            .frame(idealHeight: 250, maxHeight: 250)
    }
    
    init(urlString: String?, shouldShimmer: Bool) {
        self.photoLoaderViewModel = PhotoLoaderViewModel()
        self.urlString = urlString
        self.shouldShimmer = shouldShimmer
        fetchImage()
    }
    
    func fetchImage() {
        self.photoLoaderViewModel.fetchImage(urlString: self.urlString)
    }
    
    func containedView() -> AnyView {
        let image: UIImage
        let shouldShowShimmer: Bool
        switch photoLoaderViewModel.state {
        case .loading:
            shouldShowShimmer = true
            image = #imageLiteral(resourceName: "placeholder")
        case .completedWithNoData:
            shouldShowShimmer = false
            image = #imageLiteral(resourceName: "placeholder")
        case .completed(let loadedImage):
            shouldShowShimmer = false
            image = loadedImage
        case .failed(_):
            shouldShowShimmer = false
            image = #imageLiteral(resourceName: "placeholder")
        }
        
        return AnyView(Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .redacted(reason: (shouldShimmer || shouldShowShimmer) ? .placeholder : RedactionReasons(rawValue: 0))
        )

    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            NetworkImageView(urlString: "https://images.unsplash.com/photo-1475694867812-f82b8696d610?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjc4MjM3fQ", shouldShimmer: false)
            NetworkImageView(urlString: "https://images.unsplash.com/photo-1475694867812-f82b8696d610?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjc4MjM3fQ", shouldShimmer: false)
            NetworkImageView(urlString: "https://images.unsplash.com/photo-1475694867812-f82b8696d610?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjc4MjM3fQ", shouldShimmer: false)
        }
    }
}
