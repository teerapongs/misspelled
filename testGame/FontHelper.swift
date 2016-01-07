//
//  FontHelper.swift
//  snakeAndLadder
//
//  Created by TongThesis on 11/10/2558 BE.
//  Copyright © 2558 TongThesis. All rights reserved.
//

import Foundation
import UIKit

class FontHelper {
    
    static func printFonts() {
        for familyName in UIFont.familyNames() {
            NSLog("%@", familyName)
            for fontName in UIFont.fontNamesForFamilyName(familyName) {
                NSLog("  %@", fontName)
            }
        }
    }
    
}