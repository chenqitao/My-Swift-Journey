//
//  ColorAppearance.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import UIKit

extension ActionSheetAppearance {
    
    /**
     Get an instance of the colorful demo appearance.
    */
    static var colors: ActionSheetAppearance {
        ColorAppearance()
    }
}


/**
 This is a demo-specific action sheet appearance. It applies
 a bunch of colors to the demo sheets.
 */
class ColorAppearance: DemoAppearance {

    override func applyColors() {
        super.applyColors()
        background.backgroundColor = UIColor.purple.withAlphaComponent(0.4)
        item.subtitleColor = .blue
        link.height = 100
        selectItem.selectedTintColor = .blue
        selectItem.selectedTitleColor = .green
        selectItem.selectedIconColor = .purple
        singleSelectItem.selectedTintColor = .green
        singleSelectItem.selectedTitleColor = .purple
        singleSelectItem.selectedIconColor = .blue
        multiSelectItem.selectedTintColor = .blue
        multiSelectItem.selectedTitleColor = .green
        multiSelectItem.selectedIconColor = .purple
        
        table.backgroundColor = .yellow
        itemsTable.backgroundColor = .brown
        itemsTable.separatorColor = .purple
        buttonsTable.separatorColor = .red
    }
    
    override func applyFonts() {
        super.applyFonts()
        item.titleFont = .robotoRegular(size: 17)
        item.subtitleFont = .robotoRegular(size: 14)
        link.titleFont = .robotoRegular(size: 17)
        multiSelectToggle.titleFont = .robotoMedium(size: 13)
        sectionTitle.titleFont = .robotoMedium(size: 14)
        title.titleFont = .robotoMedium(size: 15)
        okButton.titleFont = .robotoMedium(size: 17)
        destructiveButton.titleFont = .robotoMedium(size: 17)
        cancelButton.titleFont = .robotoRegular(size: 17)
    }
    
    override func applyTextAlignments() {
        super.applyTextAlignments()
        item.itemTextAlignment = .right
    }
}
