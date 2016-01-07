//
//  LevelViewController.swift
//  testGame
//
//  Created by TongThesis on 9/12/2558 BE.
//  Copyright (c) 2558 TongThesis. All rights reserved.
//

import UIKit
import AVFoundation
class LevelViewController: UIViewController {
    
    @IBOutlet var elementary4: UIButton!
    @IBOutlet var elementary5: UIButton!
    @IBOutlet var elementary6: UIButton!
    var setLevel = 0
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
    var playerImage : String = ""
    var playerBigImage : String = ""
    
    @IBOutlet var backSun: UIImageView!
    @IBOutlet var backMercury: UIImageView!
    @IBOutlet var backVenus: UIImageView!
    @IBOutlet var backEarth: UIImageView!
    @IBOutlet var backMars: UIImageView!
    @IBOutlet var backJupiter: UIImageView!
    @IBOutlet var backSaturn: UIImageView!
    @IBOutlet var backUranus: UIImageView!
    @IBOutlet var backNeptune: UIImageView!
    @IBOutlet var backPluto: UIImageView!
    @IBOutlet var backMeteor: UIImageView!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
//    var sendValue: MultiPlayerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor(patternImage: UIImage(named: "secondBackground768x1024.jpg")!)
        hiddenBackPlayer()
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
        backSun.hidden = false
        playerImage = "sun35x35.png"
        playerBigImage = "sun200x200.png"
        elementary5.enabled = false
        elementary6.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setImagePlayer(button: UIButton){
        if button == sunPlayer{
            playerImage = "sun35x35.png"
            playerBigImage = "sun200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == mercuryPlayer{
            playerImage = "mercury35x35.png"
            playerBigImage = "mercury200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == venusPlayer{
            playerImage = "venus35x35.png"
            playerBigImage = "venus200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == earthPlayer{
            playerImage = "earth35x35.png"
            playerBigImage = "earth200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == marsPlayer{
            playerImage = "mars35x35.png"
            playerBigImage = "mars200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == jupiterPlayer{
            playerImage = "jupiter35x35.png"
            playerBigImage = "jupiter200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == saturnPlayer{
            playerImage = "saturn35x35.png"
            playerBigImage = "saturn200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == uranusPlayer{
            playerImage = "uranus35x35.png"
            playerBigImage = "uranus200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == neptunePlayer{
            playerImage = "neptune35x35.png"
            playerBigImage = "neptune200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == plutoPlayer{
            playerImage = "pluto35x35.png"
            playerBigImage = "pluto200x200.png"
            showAndhiddenBackImage(button)
        }
        else if button == meteorPlayer{
            playerImage = "meteor35x35.png"
            playerBigImage = "meteor200x200.png"
            showAndhiddenBackImage(button)
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "elementary4") {
            let sendValue = segue.destinationViewController as! MultiPlayerViewController
            sendValue.getLevelNumber = 1
            sendValue.playerP1 = playerImage
            sendValue.bigPlayerImage = playerBigImage
            sendValue.player = player
        }
        else if (segue.identifier == "elementary5") {
//            let sendPassNavigation = segue.destinationViewController as! UINavigationController
//            let sendValue = sendPassNavigation.viewControllers.first as! MultiPlayerViewController
            let sendValue = segue.destinationViewController as! MultiPlayerViewController
            sendValue.getLevelNumber = 2
            sendValue.playerP1 = playerImage
            sendValue.bigPlayerImage = playerBigImage
            sendValue.player = player
        }
        else if (segue.identifier == "elementary6") {
            let sendValue = segue.destinationViewController as! MultiPlayerViewController
            sendValue.getLevelNumber = 3
            sendValue.playerP1 = playerImage
            sendValue.bigPlayerImage = playerBigImage
            sendValue.player = player
        }
    }
    
    func hiddenBackPlayer(){
          backSun.hidden = true
          backMercury.hidden = true
          backVenus.hidden = true
          backEarth.hidden = true
          backMars.hidden = true
          backJupiter.hidden = true
          backSaturn.hidden = true
          backUranus.hidden = true
          backNeptune.hidden = true
          backPluto.hidden = true
          backMeteor.hidden = true
    }
    
    func showAndhiddenBackImage(button: UIButton){
        if button == sunPlayer{
            backSun.hidden = false
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == mercuryPlayer{
            backSun.hidden = true
            backMercury.hidden = false
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == venusPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = false
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == earthPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = false
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == marsPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = false
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == jupiterPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = false
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == saturnPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = false
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == uranusPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = false
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == neptunePlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = false
            backPluto.hidden = true
            backMeteor.hidden = true
        }
        else if button == plutoPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = false
            backMeteor.hidden = true
        }
        else if button == meteorPlayer{
            backSun.hidden = true
            backMercury.hidden = true
            backVenus.hidden = true
            backEarth.hidden = true
            backMars.hidden = true
            backJupiter.hidden = true
            backSaturn.hidden = true
            backUranus.hidden = true
            backNeptune.hidden = true
            backPluto.hidden = true
            backMeteor.hidden = false
        }
    }
    @IBAction func properties(sender: AnyObject) {
        let alertView = UIAlertController(title: "ตั้งค่าเสียงเพลง", message: "กรุณาเลือกรายการ", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alertView, animated: true, completion: nil)
        alertView.addAction(UIAlertAction(title: "เล่น", style: UIAlertActionStyle.Default, handler: {(alertView: UIAlertAction) in self.play()}))
        alertView.addAction(UIAlertAction(title: "หยุดเพลง", style: UIAlertActionStyle.Destructive, handler: {(alertView: UIAlertAction) in self.stop()}))
    }
    
    func play() {
        player.play()
    }
    
    func stop() {
        player.stop()
        
    }
}
