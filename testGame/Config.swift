//
//  Config.swift
//  testGame
//
//  Created by TongThesis on 8/30/2558 BE.
//  Copyright (c) 2558 TongThesis. All rights reserved.
//

import Foundation
import UIKit

//UI Constants
let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height



//Random number generator
func randomNumber(minX minX:UInt32, maxX:UInt32) -> Int {
    let result = (arc4random() % (maxX - minX + 1)) + minX
    return Int(result)
}

let TileMargin: CGFloat = 20.0