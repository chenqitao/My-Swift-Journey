//
//  ContentView.swift
//  ACHNBrowserUI
//
//  Created by Thomas Ricouard on 08/04/2020.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SwiftUIKit
import Backend
import UI

struct ItemsView: View {
    enum ContentMode {
        case listLarge, listSmall, grid
        
        func iconName() -> String {
            switch self {
            case .listLarge:
                return "rectangle.grid.1x2"
            case .listSmall:
                return "list.dash"
            case .grid:
                return "square.grid.3x2.fill"
            }
        }
    }
    
    @StateObject var viewModel: ItemsViewModel
    @State private var showSortSheet = false
    @State private var contentMode: ContentMode = .grid
    let customTitle: String?
    
    init(category: Backend.Category, items: [Item]? = nil, keyword: String? = nil) {
        if let items = items {
            _viewModel = StateObject(wrappedValue: ItemsViewModel(category: category, items: items))
            customTitle = nil
        } else if let keyword = keyword {
            _viewModel = StateObject(wrappedValue: ItemsViewModel(meta: keyword))
            customTitle = keyword
        } else {
            _viewModel = StateObject(wrappedValue: ItemsViewModel(category: category))
            customTitle = nil
        }
    }
    
    var currentItems: [Item] {
        get {
            if !viewModel.searchText.isEmpty {
                return viewModel.searchItems
            } else if viewModel.sort != nil {
                return viewModel.sortedItems
            } else {
                return viewModel.items
            }
        }
    }
    
    private var sortButton: some View {
        Button(action: {
            showSortSheet.toggle()
        }) {
            Image(systemName: viewModel.sort == nil ? "arrow.up.arrow.down.circle" : "arrow.up.arrow.down.circle.fill")
                .style(appStyle: .barButton)
                .foregroundColor(.acText)
        }
        .buttonStyle(BorderedBarButtonStyle())
        .accentColor(Color.acText.opacity(0.2))
        .safeHoverEffectBarItem(position: .trailing)
    }
    
    private var layoutButton: some View {
        Button(action: {
            switch contentMode {
            case .listLarge:
                contentMode = .listSmall
            case .listSmall:
                contentMode = .grid
            case .grid:
                contentMode = .listLarge
            }
        }) {
            Image(systemName: contentMode.iconName())
                .style(appStyle: .barButton)
                .foregroundColor(.acText)
        }
        .buttonStyle(BorderedBarButtonStyle())
        .accentColor(Color.acText.opacity(0.2))
        .safeHoverEffectBarItem(position: .trailing)
    }
    
    private var sortSheet: ActionSheet {
        var buttons: [ActionSheet.Button] = []
        for sort in ItemsViewModel.Sort.allCases(for: viewModel.category) {
            buttons.append(.default(Text(LocalizedStringKey(sort.rawValue.localizedCapitalized)),
                                    action: {
                                        self.viewModel.sort = sort
            }))
        }
        
        if viewModel.sort != nil {
            buttons.append(.default(Text("Clear Selection"), action: {
                self.viewModel.sort = nil
            }))
        }
        
        buttons.append(.cancel())
        
        let title = Text("Sort items")
        
        if let currentSort = viewModel.sort {
            let currentSortName = NSLocalizedString(currentSort.rawValue.localizedCapitalized, comment: "")
            return ActionSheet(title: title,
                               message: Text("Current Sort: \(currentSortName)"),
                               buttons: buttons)
        }
        
        return ActionSheet(title: title, buttons: buttons)
    }
    
    var body: some View {
        contentView
        .modifier(DismissingKeyboardOnSwipe())
        .navigationBarTitle(customTitle != nil ?
            Text(LocalizedStringKey(customTitle!)) :
            Text(viewModel.category.label()),
                            displayMode: .automatic)
            .navigationBarItems(trailing:
                                    HStack {
                                        layoutButton
                                        sortButton
                                    })
        .actionSheet(isPresented: $showSortSheet, content: { self.sortSheet })
    }
    
    @ViewBuilder
    private var contentView: some View {
        if contentMode == .grid {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 16)], spacing: 16) {
                    ForEach(currentItems) { item in
                        ItemGridItemView(item: item)
                    }
                }.background(Color.acBackground)
            }
        } else {
            List {
                Section(header: SearchField(searchText: $viewModel.searchText)) {
                    ForEach(currentItems) { item in
                        NavigationLink(destination: LazyView(ItemDetailView(item: item))) {
                            ItemRowView(displayMode: contentMode == .listLarge ? .large : .compact,
                                        item: item)
                        }
                        .listRowBackground(Color.acSecondaryBackground)
                    }
                }
            }
            .animation(.interactiveSpring())
            .listStyle(GroupedListStyle())
            .id(viewModel.sort)
        }
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView(category: .housewares)
            .environmentObject(Items.shared)
            .environmentObject(UserCollection.shared)
    }
}
