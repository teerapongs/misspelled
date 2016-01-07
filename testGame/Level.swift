//
//  Level.swift
//  testGame
//
//  Created by TongThesis on 8/30/2558 BE.
//  Copyright (c) 2558 TongThesis. All rights reserved.
//

import Foundation
struct Level {
    // let pointsPerTile: Int
    //let timeToSolve: Int
    let questionArray: [NSArray]
    let answers: [NSArray]
    
    init(levelNumber: Int) {
        //1 find .plist file for this level
        let fileName = "level\(levelNumber).plist"
        let levelPath = "\(NSBundle.mainBundle().resourcePath!)/\(fileName)"
        
        let answer = "answer\(levelNumber).plist"
        let answerPath = "\(NSBundle.mainBundle().resourcePath!)/\(answer)"
        
        //2 load .plist file
        let levelDictionary: NSDictionary? = NSDictionary(contentsOfFile: levelPath)
        let answerDictionary: NSDictionary? = NSDictionary(contentsOfFile: answerPath)
        
        //3 validation
        assert(levelDictionary != nil, "Level configuration file not found")
        assert(answerDictionary != nil, "Answer configuration file not found")
        
        //4 initialize the object from the dictionary
        //self.pointsPerTile = levelDictionary!["pointsPerTile"] as! Int
        //self.timeToSolve = levelDictionary!["timeToSolve"] as! Int
        self.questionArray = levelDictionary!["questionArray"] as! [NSArray]
        self.answers = answerDictionary!["answers"] as! [NSArray]
    }
}

