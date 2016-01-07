//
//  randomPlayerBot.swift
//  snakeAndLadder
//
//  Created by TongThesis on 10/21/2558 BE.
//  Copyright © 2558 TongThesis. All rights reserved.
//

import Foundation
struct RandomPlayerBot{
    
    let randomPlayer: [NSArray]
    
    init(levelNumber: Int) {
        //1 find .plist file for this level
        let player = "player\(levelNumber).plist"
        let playerPath = "\(NSBundle.mainBundle().resourcePath!)/\(player)"
        
        //2 load .plist file
        let playerDictionary: NSDictionary? = NSDictionary(contentsOfFile: playerPath)
        
        //3 validation
        assert(playerDictionary != nil, "Player configuration file not found")
        
        //4 initialize the object from the dictionary
        self.randomPlayer = playerDictionary!["randomPlayer"] as! [NSArray]
    }
}

