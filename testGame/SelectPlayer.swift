//
//  selectPlayer.swift
//  snakeAndLadder
//
//  Created by TongThesis on 10/14/2558 BE.
//  Copyright © 2558 TongThesis. All rights reserved.
//

import UIKit
class SelectPlayer: UIViewController{
    
    @IBOutlet var sunPlayer: UIButton!
    @IBOutlet var mercuryPlayer: UIButton!
    @IBOutlet var venusPlayer: UIButton!
    @IBOutlet var earthPlayer: UIButton!
    @IBOutlet var marsPlayer: UIButton!
    @IBOutlet var jupiterPlayer: UIButton!
    @IBOutlet var saturnPlayer: UIButton!
    @IBOutlet var uranusPlayer: UIButton!
    @IBOutlet var neptunePlayer: UIButton!
    @IBOutlet var plutoPlayer: UIButton!
    @IBOutlet var meteorPlayer: UIButton!
    var sendPlayer: SinglePlayerViewController!
    var playerImage : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor(patternImage: UIImage(named: "secondBackground768x1024.jpg")!)
        sunPlayer.setBackgroundImage(UIImage(named: "sun200x200.png"), forState: UIControlState.Normal)
        mercuryPlayer.setBackgroundImage(UIImage(named: "mercury200x200.png"), forState: UIControlState.Normal)
        venusPlayer.setBackgroundImage(UIImage(named: "venus200x200.png"), forState: UIControlState.Normal)
        earthPlayer.setBackgroundImage(UIImage(named: "earth200x200.png"), forState: UIControlState.Normal)
        marsPlayer.setBackgroundImage(UIImage(named: "mars200x200.png"), forState: UIControlState.Normal)
        jupiterPlayer.setBackgroundImage(UIImage(named: "jupiter200x200.png"), forState: UIControlState.Normal)
        saturnPlayer.setBackgroundImage(UIImage(named: "saturn200x200.png"), forState: UIControlState.Normal)
        uranusPlayer.setBackgroundImage(UIImage(named: "uranus200x200.png"), forState: UIControlState.Normal)
        neptunePlayer.setBackgroundImage(UIImage(named: "neptune200x200.png"), forState: UIControlState.Normal)
        plutoPlayer.setBackgroundImage(UIImage(named: "pluto200x200.png"), forState: UIControlState.Normal)
        meteorPlayer.setBackgroundImage(UIImage(named: "meteor200x200.png"), forState: UIControlState.Normal)
    }

    @IBAction func setImagePlayer(button: UIButton){
        if button == sunPlayer{
            playerImage = "sun35x35.png"
        }
        else if button == mercuryPlayer{
            playerImage = "mercury35x35.png"
        }
        else if button == venusPlayer{
            playerImage = "venus35x35.png"
        }
        else if button == earthPlayer{
            playerImage = "earth35x35.png"
        }
        else if button == marsPlayer{
            playerImage = "mars35x35.png"
        }
        else if button == jupiterPlayer{
            playerImage = "jupiter35x35.png"
        }
        else if button == saturnPlayer{
            playerImage = "saturn35x35.png"
        }
        else if button == uranusPlayer{
            playerImage = "uranus35x35.png"
        }
        else if button == neptunePlayer{
            playerImage = "neptune35x35.png"
        }
        else if button == plutoPlayer{
            playerImage = "pluto35x35.png"
        }
        else if button == meteorPlayer{
            playerImage = "meteor35x35.png"
        }
        
    }
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sc = segue.destinationViewController as! SinglePlayerViewController
            sc.getPlayer = playerImage
    }
}