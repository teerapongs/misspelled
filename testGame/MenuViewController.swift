//
//  MenuViewController.swift
//  testGame
//
//  Created by TongThesis on 9/12/2558 BE.
//  Copyright (c) 2558 TongThesis. All rights reserved.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {
    
    @IBOutlet var singlePlayer: UIButton!
    @IBOutlet var multiPlayer: UIButton!
    @IBOutlet var howToPlay: UIButton!
    var getNumber = 0
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor  = UIColor(patternImage: UIImage(named: "fristBackground768x1024.jpg")!)
        singlePlayer.setBackgroundImage(UIImage(named: "เล่นคนเดียว2.png"), forState: UIControlState.Normal)
        multiPlayer.setBackgroundImage(UIImage(named:"เล่นกับเพื่อน3.png"), forState: UIControlState.Normal)
        howToPlay.setBackgroundImage(UIImage(named: "single.png"), forState: UIControlState.Normal)
        howToPlay.hidden = true
        
        let audioPath = NSBundle.mainBundle().pathForResource("cute4", ofType: "mp3")
        var error:NSError? = nil
        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
//            player.play()
//            player.numberOfLoops = -1
            
        }
        catch {
            print("Something bad happened. Try catching specific errors to narrow things down")
        }
     
//        FontHelper.printFonts()
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
    func pause() {
        player.pause()
        
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "sendData") {
            let sendValue = segue.destinationViewController as! SinglePlayerViewController
                sendValue.player = player
        }
        else if (segue.identifier == "sendDataToMultiplay"){
            let sendValue = segue.destinationViewController as! LevelViewController
            sendValue.player = player
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
}
