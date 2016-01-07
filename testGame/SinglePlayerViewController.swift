//
//  SinglePlayerViewController.swift
//  testGame
//
//  Created by TongThesis on 9/12/2558 BE.
//  Copyright (c) 2558 TongThesis. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit
import AVFoundation
class SinglePlayerViewController: UIViewController {
    @IBOutlet var imageDice: UIImageView!
    @IBOutlet var board: UIImageView!
    @IBOutlet var boardView: UIView!
    var imageView : UIImageView?
    var diceNumber : Int!
    var diceNumber2 : Int!
    var p1 : UIImageView?
    var p2 = UIImageView(image: UIImage(named: "mars35x35.png"))
    var testPlayer : UIImageView?
    var sumNumberDice :Int = 0
    var sumNumberDices : [Int] = [0,0]
    var levelTable : Int = 0
    var levelsTable : [Int] = [0,0]
    var walking : Int = 0
    var count = 0
    var leftRim : CGFloat?
    var rightRim: CGFloat?
    var jumpTo : [Int] = [7,10,25,39,64,69,81]
    var jumpToDes : [Int] = [6,21,20,18,12,23,19]
    var downTo : [Int] = [15,22,34,61,70,86,97]
    var downToDes : [Int] = [-10,-20,-6,-41,-22,-18,-13]
    var timer:NSTimer?
    var time:Int = 0
    var gridUnitWidth: CGFloat?
    var gridUnitHeight: CGFloat?
    var enderGame:Bool = false
//    var buttonDice: UIButton?
    var getPlayer : String =  ""
    var randomBot: RandomPlayerBot!
    var randomPlayerBot : Int = 0
    var checkPLayer: String = ""
    var image = UIImage(named: "dice1.png")!

    @IBOutlet var buttonDice: UIButton!
    
    
    @IBOutlet var warpGates7: UIImageView!
    @IBOutlet var warpGates10: UIImageView!
    @IBOutlet var warpGates25: UIImageView!
    @IBOutlet var warpGates39: UIImageView!
    @IBOutlet var warpGates64: UIImageView!
    @IBOutlet var warpGates69: UIImageView!
    @IBOutlet var warpGates81: UIImageView!
    
    @IBOutlet var blackHole15: UIImageView!
    @IBOutlet var blackHole22: UIImageView!
    @IBOutlet var blackHole34: UIImageView!
    @IBOutlet var blackHole61: UIImageView!
    @IBOutlet var blackHole70: UIImageView!
    @IBOutlet var blackHole86: UIImageView!
    @IBOutlet var blackHole97: UIImageView!
    
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
    
    @IBOutlet var sunPlayerImage: UIImageView!
    @IBOutlet var mercuryPlayerImage: UIImageView!
    @IBOutlet var venusPlayerImage: UIImageView!
    @IBOutlet var earthPlayerImage: UIImageView!
    @IBOutlet var marsPlayerImage: UIImageView!
    @IBOutlet var jupiterPlayerImage: UIImageView!
    @IBOutlet var saturnPlayerImage: UIImageView!
    @IBOutlet var uranusPlayerImage: UIImageView!
    @IBOutlet var neptunePlayerImage: UIImageView!
    @IBOutlet var plutoPlayerImage: UIImageView!
    @IBOutlet var meteorPlayerImage: UIImageView!
    @IBOutlet var selectCharactor: UIImageView!
    
    
    @IBOutlet var backNew22: UIImageView!
    @IBOutlet var backNew34: UIImageView!
    @IBOutlet var backNew61: UIImageView!
    @IBOutlet var backNew64: UIImageView!
    @IBOutlet var backNew69: UIImageView!
    @IBOutlet var backNew70: UIImageView!
    @IBOutlet var backNew86: UIImageView!
    @IBOutlet var backNew97: UIImageView!
    @IBOutlet var backNew81: UIImageView!
    
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
    
    @IBOutlet var firstGame: UIButton!
    @IBOutlet var pauseButton: UIButton!
    
    var playerImage : String = ""
    var canPlay: Bool = false
    
    var push : MenuViewController!
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor(patternImage: UIImage(named: "secondBackground768x1024.jpg")!)
        
        
        setBackgroundImagePlayer()
        imageView = UIImageView(image: image)
//        buttonDice = UIButton(frame: CGRect(x: 335 , y: 820, width: 100, height: 100))
        //        buttonDice!.frame.origin = CGPoint(x: 10, y: 10)
//        buttonDice!.setTitle("button1", forState: UIControlState.Normal)
//        buttonDice!.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        buttonDice!.setImage(UIImage(named: "dice1.png"), forState: UIControlState.Normal)
//        buttonDice!.addTarget(self, action: "randomButton:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(buttonDice!)
        buttonDice!.hidden = true
        imageView!.hidden = true
        sumNumberDices[count] = 0
        p2.hidden = true
        hiddenBackPlayer()
        backSun.hidden = false
        playerImage = "sun35x35.png"
        p1 = UIImageView(image: UIImage(named: playerImage))
        board.hidden = true
        firstGame.hidden = false
        showAndHiddenPlayer(false)
        showAndHiddenPlayerImage(false)
        hiddenWarpGates()
        hiddenBlackHole()
        showAndHiddenBackNew(true)
        
//        let audioPath = NSBundle.mainBundle().pathForResource("cute4", ofType: "mp3")
//        var error:NSError? = nil
//        do {
//            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
//        }
//        catch {
//            print("Something bad happened. Try catching specific errors to narrow things down")
//        }

        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setBackgroundImagePlayer() {
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
    
    @IBAction func setImagePlayer(button: UIButton) {
        count = 0
        if button == sunPlayer {
            playerImage = "sun35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == mercuryPlayer {
            playerImage = "mercury35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == venusPlayer {
            playerImage = "venus35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == earthPlayer {
            playerImage = "earth35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == marsPlayer {
            playerImage = "mars35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == jupiterPlayer {
            playerImage = "jupiter35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == saturnPlayer {
            playerImage = "saturn35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == uranusPlayer {
            playerImage = "uranus35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == neptunePlayer {
            playerImage = "neptune35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == plutoPlayer {
            playerImage = "pluto35x35.png"
            showAndhiddenBackImage(button)
        }
        else if button == meteorPlayer {
            playerImage = "meteor35x35.png"
            showAndhiddenBackImage(button)
        }
    }
    
    func hiddenBackPlayer() {
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
    
    func showAndhiddenBackImage(button: UIButton) {
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
        else if button == mercuryPlayer {
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
        else if button == earthPlayer {
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
        else if button == marsPlayer {
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
        else if button == jupiterPlayer {
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
        else if button == saturnPlayer {
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
        else if button == uranusPlayer {
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
        else if button == neptunePlayer {
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
        else if button == plutoPlayer {
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
        else if button == meteorPlayer {
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
    
    @IBAction func firstPlay(button: UIButton) {
        count = 0
        canPlay = true
        diceNumber = 0
        sumNumberDices[1] = 0
        sumNumberDices[0] = 0
        showAndHiddenPlayer(true)
        showAndHiddenPlayerImage(true)
        board.hidden = false
//        botPlay(true)
        buttonDice!.hidden = false
        buttonDice!.enabled = true
        firstGame.hidden = true
        pauseButton.enabled = true
        hiddenBackPlayer()
        buttonDice!.setImage(UIImage(named: "dice1.png"), forState: UIControlState.Normal)
        allFisrt()
    }
    @IBAction func newGame() {
        
        let alertView = UIAlertController(title: "WARNING!!!", message: "คุณต้องการเริ่มเกมใหม่หรือไม่", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alertView, animated: true, completion: nil)
        alertView.addAction(UIAlertAction(title: "ใช่", style: UIAlertActionStyle.Destructive , handler: {(alertView: UIAlertAction) in self.afterClickNewGame()}))
        alertView.addAction(UIAlertAction(title: "เริ่มเกมใหม่", style: UIAlertActionStyle.Cancel, handler: {(alertView: UIAlertAction) in self.afterClickNewGame()}))
        alertView.addAction(UIAlertAction(title: "ไม่", style: UIAlertActionStyle.Default, handler: nil))
//        sumNumberDices[1] = 100
//        self.viewDidLoad()
    }
    
    func afterClickNewGame() {
        canPlay = false
        timeStop()
        buttonDice!.hidden = true
        imageView!.hidden = true
        sumNumberDices[1] = 0
        sumNumberDices[0] = 0
        buttonDice!.setImage(UIImage(named: "dice1.png"), forState: UIControlState.Normal)
        p1!.hidden = true
        p2.hidden = true
        enderGame = false
//        botPlay(false)
        pauseButton.enabled = true
        setBackgroundImagePlayer()
        showAndHiddenPlayer(false)
        showAndHiddenPlayerImage(false)
        hiddenWarpGates()
        hiddenBlackHole()
        showAndHiddenBackNew(true)
        board.hidden = true
        backSun.hidden = false
        firstGame.hidden = false
    }
    
    func allFisrt() {
        board.frame.size = CGSizeMake(700.0, 700.0)
        showAndHiddenBackNew(false)
        print(playerImage)
        p1 = UIImageView(image: UIImage(named: playerImage))
        let sendLevel = RandomPlayerBot(levelNumber: 1)
        randomBot = sendLevel
        playerPlist()
        if checkPLayer == playerImage {
            playerPlist()
            p2 = UIImageView(image: UIImage(named: checkPLayer))
        }
        else {
            p2 = UIImageView(image: UIImage(named: checkPLayer))
        }
        
        leftRim = (board.frame.size.width/10) //70
        rightRim = leftRim!*9 //70*9 = 630
        gridUnitWidth = leftRim
        gridUnitHeight = board.frame.size.height/10
        
        let playerWidth: CGFloat = 35
        let startPlayerX: CGFloat = ((leftRim!/2)-(p1!.frame.size.width/2))-leftRim!
        let startPlayerY: CGFloat = board.frame.size.height-((board.frame.size.height/10)/2)-(playerWidth/2)
        let startPlayer2X: CGFloat = ((leftRim!/2)-(p2.frame.size.width/2))-leftRim!
        
        p1!.frame = CGRect(x: startPlayerX, y: startPlayerY, width: playerWidth, height: playerWidth)
        p2.frame = CGRect(x: startPlayer2X, y: startPlayerY, width: playerWidth, height: playerWidth)
        p1!.hidden = true
        p2.hidden = true
        board.addSubview(p1!)
        board.addSubview(p2)

    }
    
    func showAndHiddenPlayer(bool:Bool) {
        sunPlayer.hidden = bool
        mercuryPlayer.hidden = bool
        venusPlayer.hidden = bool
        earthPlayer.hidden = bool
        marsPlayer.hidden = bool
        jupiterPlayer.hidden = bool
        saturnPlayer.hidden = bool
        uranusPlayer.hidden = bool
        neptunePlayer.hidden = bool
        plutoPlayer.hidden = bool
        meteorPlayer.hidden = bool
        selectCharactor.hidden = bool
    }
    
    func showAndHiddenPlayerImage(bool:Bool) {
        sunPlayerImage.hidden = bool
        mercuryPlayerImage.hidden = bool
        venusPlayerImage.hidden = bool
        earthPlayerImage.hidden = bool
        marsPlayerImage.hidden = bool
        jupiterPlayerImage.hidden = bool
        saturnPlayerImage.hidden = bool
        uranusPlayerImage.hidden = bool
        neptunePlayerImage.hidden = bool
        plutoPlayerImage.hidden = bool
        meteorPlayerImage.hidden = bool
    }
    
    func showAndHiddenBackNew(bool: Bool) {
        backNew22.hidden = bool
        backNew34.hidden = bool
        backNew61.hidden = bool
        backNew64.hidden = bool
        backNew69.hidden = bool
        backNew70.hidden = bool
        backNew86.hidden = bool
        backNew97.hidden = bool
        backNew81.hidden = bool
    }
    
    @IBAction func randomButton(sender: AnyObject) {
        p1!.hidden = false
//        buttonDice!.hidden = true
        buttonDice!.enabled = false
        hiddenWarpGates()
        hiddenBlackHole()
        play()
    }
    
    func play() {
        //random
        random()
        timeStart()
    }
    
    func checkLadder() {
        // chcek ladder
        let findJump = jumpTo.indexOf(sumNumberDices[count])
        let findDown = downTo.indexOf(sumNumberDices[count])
        if findJump != nil {
            diceNumber = jumpToDes[findJump!]
            sumRandomdice(sender: diceNumber)
            print(count)
            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(0.4), target: self, selector: "showWarpGates", userInfo: nil, repeats: false)
            hiddenP()
            jumpTo(checkAccount())
            
        }
        else if findDown != nil {
            diceNumber = downToDes[findDown!]
            sumRandomdice(sender: diceNumber)
            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(0.4), target: self, selector: "showBlackHole", userInfo: nil, repeats: false)
            hiddenP()
            jumpTo(checkAccount())
        }

    }
    
    func showP() {
        if count == 1 {
            self.p1!.hidden = false
            if sumNumberDices[count] == 100{
                self.p2.hidden = false
            }
        }
        else if count == 0 {
            self.p2.hidden  = false
            if sumNumberDices[count] == 100{
                self.p1!.hidden = false
            }
            
        }
    }
    
    func hiddenP() {
        if count == 0{
            self.p1!.hidden = true
        }
        else if count == 1{
            self.p2.hidden  = true
        }
    }
//    6,19,20,18,12,23,19
    func showWarpGates() {
        if count == 0{
            switch diceNumber {
            case 6: warpGates7.hidden = false
                break
            case 21: warpGates10.hidden = false
                break
            case 20: warpGates25.hidden = false
                break
            case 18: warpGates39.hidden = false
                break
            case 12: warpGates64.hidden = false
                break
            case 23: warpGates69.hidden = false
                break
            default : warpGates81.hidden = false
                     showP()
                break
            }
        }
        else if count == 1 {
            switch diceNumber {
            case 6: warpGates7.hidden = false
                break
            case 21: warpGates10.hidden = false
                break
            case 20: warpGates25.hidden = false
                break
            case 18: warpGates39.hidden = false
                break
            case 12: warpGates64.hidden = false
                break
            case 23: warpGates69.hidden = false
                break
            default : warpGates81.hidden = false
                     showP()
                break
            }
        }
    }
    
    func hiddenWarpGates() {
        warpGates7.hidden = true
        warpGates10.hidden = true
        warpGates25.hidden = true
        warpGates39.hidden = true
        warpGates64.hidden = true
        warpGates69.hidden = true
        warpGates81.hidden = true
    }
//[15,22,34,61,70,85,97]
//[-10,-20,-22,-41,-22,-18,-13]
    func showBlackHole() {
        if count == 0{
            switch diceNumber {
            case -10: blackHole15.hidden = false
                break
            case -20: blackHole22.hidden = false
                break
            case -6 : blackHole34.hidden = false
                break
            case -22: blackHole70.hidden = false
                break
            case -41: blackHole61.hidden = false
                break
            case -18: blackHole86.hidden = false
                break
            default : blackHole97.hidden = false
                break
            }
        }
        else if count == 1 {
            switch diceNumber {
            case -10: blackHole15.hidden = false
                break
            case -20: blackHole22.hidden = false
                break
            case -6 : blackHole34.hidden = false
                break
            case -22: blackHole70.hidden = false
                break
            case -41: blackHole61.hidden = false
                break
            case -18: blackHole86.hidden = false
                break
            default : blackHole97.hidden = false
                break

            }
        }
    }
    
    func hiddenBlackHole() {
        blackHole15.hidden = true
        blackHole22.hidden = true
        blackHole34.hidden = true
        blackHole61.hidden = true
        blackHole70.hidden = true
        blackHole86.hidden = true
        blackHole97.hidden = true
    }
    
    func timeRunning() {
        print(time)
        time++
        if canPlay == true {
            if time > diceNumber {
                timeStop()
                NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1), target: self, selector: "checkLadderAndSwitchPlayer", userInfo: nil, repeats: false)
            }
            else {
                selectPlayer()
            }
        }
        else {
            buttonDice!.hidden = true
            p2.hidden = true
            self.timeStop()
        }

    }
    
    func checkLadderAndSwitchPlayer() {
        checkLadder()
        switchAccount()
    }
    
    func selectPlayer() {
        walk(checkAccount())
        walking = ((sumNumberDices[count] - diceNumber)+time)
        if walking >= 100 {
            endGame()
        }
    }
    
    func walk(player: UIImageView) {
        calculateDirection(player)
        calculateWalking(time)
    }
    
    func jumpTo(player: UIImageView) {
//        var start = sumNumberDices[count]+abs(diceNumber)
        let end = Int(sumNumberDices[count])
        let levelsTableEnd = getLevelTable(end)
        let y = (CGFloat(10 - levelsTableEnd) * gridUnitHeight!) + (gridUnitHeight!/2)
        let toCenter:CGFloat = (gridUnitWidth!/2)
        var x:CGFloat?
        let desFigure:CGFloat = CGFloat(end%10)
        
        if levelsTableEnd%2 == 0 {
            
            if desFigure == 0 {
                x = desFigure*gridUnitWidth! + toCenter
            }
            else {
                x = (10-desFigure)*gridUnitWidth! + toCenter
            }
        }
        else {
            
            if desFigure == 0 {
                x = (10-1)*gridUnitWidth! + toCenter
            }
            else {
                x = (desFigure-1)*gridUnitWidth! + toCenter
            }
        }
        jump(player, point:CGPointMake(x!, y))
        levelsTable[count] = levelsTableEnd
        if end >= 100 {
            endGame()
        }
    }
    
    func checkAccount() -> UIImageView {
        var p:UIImageView?
        if count == 0{
            p = p1
        }
        else if count == 1{
            p = p2
        }
        return p!
    }
    
    func calculateDirection(player: UIImageView) {
        if player.frame.origin.x < 0 {
            self.leftToright(player)
        }
        else if player.frame.origin.x < leftRim {
            //println("leftRim")
            if levelsTable[count]%2 == 1 {
                leftToright(player)
            }
            else {
                up(player)
            }
        }
        else if player.frame.origin.x > rightRim {
            if levelsTable[count]%2 == 0 {
                rightToLeft(player)
            }
            else {
                
                up(player)
            }
        }
        else {
            
            if levelsTable[count]%2 == 0 {
                rightToLeft(player)
            }
            else {
                leftToright(player)
            }
        }
    }

    func calculateWalking(step:Int) {
        walking = ((sumNumberDices[count] - diceNumber)+step)
        levelsTable[count] = getLevelTable(walking)
    }
    
    func switchAccount() {
        //switch account
        if !enderGame {
            //count = 1
            count = ( count == 1 ) ? 0 : 1
            if count == 1{
//                buttonDice!.hidden = true
                pauseButton.enabled = false
                buttonDice!.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0), target: self, selector: "botPlay", userInfo: nil, repeats: false)
            }
            else if count == 0 {
                pauseButton.enabled = true
                buttonDice!.hidden = false
                buttonDice!.enabled = true
            }
        }
    }
    
    func endGame() {
        enderGame = true
        timeStop()
        buttonDice!.enabled = false
        pauseButton.enabled = true
//        NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0), target: self, selector: "getWinner", userInfo: nil, repeats: false)
        getWinner()
    }
    
    func getLevelTable(des:Int) -> Int {
        var level:Int?
        if des%10 == 0 {
            level = (des/10)
        }
        else {
            level = (des/10)+1
        }
        
        return level!
    }
    
    func getWinner() {
        for i in 0..<sumNumberDices.count {
            if sumNumberDices[i] >= 100 {
                NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0), target: self, selector: "alertViewGetWin", userInfo: nil, repeats: false)
                break
            }
        }
    }
    
    func alertViewGetWin() {
        for _ in 0...1{
            if count == 0 {
                let alertView = UIAlertController(title: "Player \(1) win!!!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                self.presentViewController(alertView, animated: true, completion: nil)
                alertView.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.Cancel, handler: nil))
                let imageAlertView = UIImageView(frame: CGRectMake(89, -150, 100, 100))
                imageAlertView.image = UIImage(named: "dice1.png")
                alertView.view.addSubview(imageAlertView)
                print("Player \(1) win!!!")
            }
            else if count == 1 {
                let alertView = UIAlertController(title: "Player \(2) win!!!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                self.presentViewController(alertView, animated: true, completion: nil)
                alertView.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.Cancel, handler: nil))
                let imageAlertView = UIImageView(frame: CGRectMake(89, -150, 100, 100))
                imageAlertView.image = UIImage(named: "dice2.png")
                alertView.view.addSubview(imageAlertView)
                print("Player \(2) win!!!")

            }
            //                alertView.addAction(UIAlertAction(title: "ใช่", style: UIAlertActionStyle.Cancel, handler: {(alertView: UIAlertAction) in self.sendAlertView()}))
            //                alertView.addAction(UIAlertAction(title: "เล่นต่อ", style: UIAlertActionStyle.Default, handler: {(alertView: UIAlertAction) in self.newGame()}))
            
            
        }
    }
    
    //Timer
    func timeStart() {
        time = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "timeRunning", userInfo: nil, repeats: true)
    }
    
    func timeStop() {
        timer?.invalidate()
    }
    
    func rightToLeft(player: UIImageView) {
        UIView.animateWithDuration(1.0, animations: {
            player.layer.position.x -= (self.board.frame.size.width/10)
            
        })
    }
    
    func leftToright(player: UIImageView){
        UIView.animateWithDuration(1.0, animations: {
            player.layer.position.x += (self.board.frame.size.width/10)
            
        })
    }
    
    func up(player: UIImageView) {
        UIView.animateWithDuration(1.0, animations: {
            player.layer.position.y -= (self.board.frame.size.height/10)
            
            //println(self.board.frame.size.height/10)
        })
    }
    
    func down(player: UIImageView) {
        UIView.animateWithDuration(1.0, animations: {
            player.layer.position.y += (self.board.frame.size.height/10)
        })
    }
    
    func jump(player: UIImageView, point:CGPoint) {
        UIView.animateWithDuration(1.0, animations: {
            player.layer.position = point
            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(2.0), target: self, selector: "hiddenWarpGates", userInfo: nil, repeats: false)
            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(2.0), target: self, selector: "hiddenBlackHole", userInfo: nil, repeats: false)
            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(0.85), target: self, selector: "showP", userInfo: nil, repeats: false)
        })
        //        showP()
    }
    
    func sumRandomdice(sender sum: Int) -> Int {
        sumNumberDices[count] = sumNumberDices[count] + diceNumber
        print(" Player: \(count+1), sumNumberDice = \(sumNumberDices[count])")
        return sumNumberDice
    }
    
    func random() {
//        diceNumber = 50
        diceNumber = randomNumber(1, maxX: UInt32(6))
        //set dict
        image = UIImage(named: "dice\(diceNumber).png")!
        imageView = UIImageView(image: image)
        imageView!.frame = CGRect(x: 335, y: 820, width: 100, height: 100)
//        view.addSubview(imageView!)
//        buttonDice!.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonDice!.setImage(image, forState: UIControlState.Normal)
        
        sumRandomdice(sender: diceNumber)
    }
    
    func randomNumber(minX:UInt32, maxX:UInt32) -> Int {
        let result = (arc4random() % (maxX - minX + 1)) + minX
        return Int(result)
    }
    
//    func beforeBotplay(){
//        botPlay(true)
//    }
    
    func botPlay() {
        p2.hidden = false
        //        buttonDice!.hidden = true
        buttonDice!.enabled = false
        play()
    }
    
    @IBAction func pauseGame() {
        let alertView = UIAlertController(title: "Pause Game", message: "คุณต้องการออกจากเกมหรือไม่", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alertView, animated: true, completion: nil)
        alertView.addAction(UIAlertAction(title: "ใช่", style: UIAlertActionStyle.Destructive, handler: {(alertView: UIAlertAction) in self.sendAlertView()}))
        alertView.addAction(UIAlertAction(title: "เริ่มเกมใหม่", style: UIAlertActionStyle.Cancel, handler: {(alertView: UIAlertAction) in self.afterClickNewGame()}))
        alertView.addAction(UIAlertAction(title: "เล่นต่อ", style: UIAlertActionStyle.Default, handler: nil))
    }
    
   @IBAction func sendAlertView() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
//    func newGame(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewControllerWithIdentifier("SelectPlayer") as! UINavigationController
//        
////        let sendPassNavigation = storyboard.instantiateInitialViewController() as! UINavigationController
////        let sendValue = sendPassNavigation.viewControllers.first as! SelectPlayer
//        self.navigationController?.popToViewController(controller, animated: true)
//        
//        //        self.presentViewController(controller, animated: false, completion: nil)
//        
//     
//    }
    
    func randomBotPlay() {
        randomPlayerBot = randomNumber2(minX: 0, maxX:UInt32(randomBot.randomPlayer.count-1))
    }
    
    func randomNumber2(minX minX:UInt32, maxX:UInt32) -> Int {
        let result = (arc4random() % (maxX - minX + 1)) + minX
        return Int(result)
    }
    
    func playerPlist() {
        randomBotPlay()
        //1
        assert(randomBot.randomPlayer.count > 0, "no level loaded")
        
        //2
        let playerPair = randomBot.randomPlayer[randomPlayerBot]
        
        //3
        checkPLayer = playerPair[0] as! String
        
        //4
        let player1length = checkPLayer.characters.count
        
        
        //5
        print("phrase1[\(player1length)]: \(checkPLayer)")
    }
    
    @IBAction func properties(sender: AnyObject) {
        let alertView = UIAlertController(title: "ตั้งค่าเสียงเพลง", message: "กรุณาเลือกรายการ", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alertView, animated: true, completion: nil)
        alertView.addAction(UIAlertAction(title: "เล่น", style: UIAlertActionStyle.Default, handler: {(alertView: UIAlertAction) in self.playSong()}))
        alertView.addAction(UIAlertAction(title: "หยุดเพลง", style: UIAlertActionStyle.Destructive, handler: {(alertView: UIAlertAction) in self.stopSong()}))
    }
    func playSong() {
        player.play()
        
    }
    
    func stopSong() {
        player.stop()
        
    }
}
