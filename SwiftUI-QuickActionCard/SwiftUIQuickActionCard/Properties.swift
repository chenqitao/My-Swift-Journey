//
//  Properties.swift
//  SwiftUIQuickActionCard
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

internal final class CardViewProperties: ObservableObject, Properties {
    @Published var cornerRadius: CGFloat
    @Published var cardPadding: CGFloat
    @Published var shouldHapticTapOnAppear: Bool
    @Published var hasDismissButton: Bool
    @Published var shouldDismissOntap: Bool
    @Published var overlaysUIScreen: Bool
    
    init() {
        self.cornerRadius = 10
        self.cardPadding = 5
        self.shouldHapticTapOnAppear = false
        self.hasDismissButton = false
        self.shouldDismissOntap = false
        self.overlaysUIScreen = false
    }
}
