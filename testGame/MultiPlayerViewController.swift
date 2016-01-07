//
//  MultiPlayerViewController.swift
//  testGame
//
//  Created by TongThesis on 9/12/2558 BE.
//  Copyright (c) 2558 TongThesis. All rights reserved.
//
import Foundation
import UIKit
import MultipeerConnectivity
import AVFoundation
class MultiPlayerViewController: UIViewController,MCBrowserViewControllerDelegate {
    
//    @IBOutlet var imageDice: UIImageView!
    @IBOutlet var board: UIImageView!
    @IBOutlet var boardView: UIView!
    var getValue: LevelViewController!
   // var imageView : UIImageView?
    @IBOutlet var imageView: UIImageView!
    var diceNumber : Int!
    var diceNumber2 : Int!
    var p1 = UIImageView(image: UIImage(named: ""))
    var p2 = UIImageView(image: UIImage(named: ""))
    var sumNumberDice : Int = 0
    var sumNumberDice2 : Int = 0
    var sumNumberDices : [Int] = [0,0]
    var levelTable : Int = 0
    var levelsTable : [Int] = [0,0]
    var walking : Int = 0
    var playerIndex = 0
    var leftRim : CGFloat?
    var rightRim: CGFloat?
    var jumpTo : [Int] = [7,10,25,39,64,69,81]
    var jumpToDes : [Int] = [6,21,20,18,12,23,19]
    var downTo : [Int] = [15,22,34,61,70,86,97]
    var downToDes : [Int] = [-10,-20,-6,-41,-22,-18,-13]
    var timer:NSTimer?
    var time:Int = 0
    var enderGame:Bool = false
    
    var playerWidth: CGFloat = 0.0
    var startPlayerX: CGFloat = 0.0
    var startPlayerY: CGFloat = 0.0
    var startPlayer2X: CGFloat = 0.0
    //var buttonDice: UIButton!
    @IBOutlet var buttonDice: UIButton!
    
    var gridUnitWidth: CGFloat?
    var gridUnitHeight: CGFloat?
    //////////////////////////////////////
    @IBOutlet var labelQuestion: UILabel!
    @IBOutlet var buttonAnswerA: UIButton!
    @IBOutlet var buttonAnswerB: UIButton!
    @IBOutlet var buttonAnswerC: UIButton!
    @IBOutlet var buttonAnswerD: UIButton!
    
    
    @IBOutlet var LabelSumNumberP1: UILabel!
    @IBOutlet var LabelSumNumberP2: UILabel!
    @IBOutlet var rollDiceMe: UILabel!
    @IBOutlet var rollDiceFriend: UILabel!
    
    var level : Level!
    var getLevel : LevelViewController!
    var getLevelNumber =  Int()
    var randomQuestion: Int = 0
    var question: String = ""
    var answerA: String = ""
    var answerB: String = ""
    var answerC: String = ""
    var answerD: String = ""
    var checkAnswer: String = ""
    
    var correct = false
    var appDelegate:AppDelegate!
    
    //RandomDice
    var meDice : Int = 0
    var friendDice : Int = 0
    var myScore : Int = 0
    var friendScore : Int = 0
    var randomNumber :Int!
    var sequence : Int = 0
    var onePass : Int = 0
    var image = UIImage()
    
    
    var checkPLayer: String = ""
    var randomBot: RandomPlayerBot!
    var randomPlayerBot : Int = 0
    var playerP1: String = ""
    var playerP2: String = ""
    var bigPlayerImage: String = ""
    var getBigImage: String = ""
    
    //
    
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
    @IBOutlet var blackHole85: UIImageView!
    @IBOutlet var blackHole97: UIImageView!
    
    var waitFriendImage = UIImageView(image: UIImage(named: ""))
    @IBOutlet var friendTurnImage: UIImageView!
    @IBOutlet var pleaseWait: UIImageView!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor  = UIColor(patternImage: UIImage(named: "secondBackground768x1024.jpg")!)
//        imageView!.frame = CGRect(x: 560, y: 850, width: 100, height: 100)
//        buttonDice!.setTitle("button1", forState: UIControlState.Normal)
        imageView = UIImageView(image: UIImage(named: "dice1.png"))
        buttonDice!.setBackgroundImage(UIImage(named: "dice1.png"), forState: UIControlState.Normal)
        buttonDice!.addTarget(self, action: "randomButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonDice!)
        buttonDice!.enabled = false
        hiddenWarpGates()
        hiddenBlackHole()
        hiddenWaitFriendImage(true)
        
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.mpcHandler.setupPeerWithDisplayName(UIDevice.currentDevice().name)
        appDelegate.mpcHandler.setupSession()
        appDelegate.mpcHandler.advertiseSelf(true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "peerChangedStateWithNotification:", name: "MPC_DidChangeStateNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleReceivedDataWithNotification:", name: "MPC_DidReceiveDataNotification", object: nil)
        
        board.frame.size = CGSizeMake(700.0, 700.0)
//        buttonDice.frame.origin = CGPoint(x: 10, y: 10)
        leftRim = (board.frame.size.width/10) //70
        rightRim = leftRim!*9 //70*9 = 630
        gridUnitWidth = leftRim
        gridUnitHeight = board.frame.size.height/10
        
        let sendLevel = RandomPlayerBot(levelNumber: 1)
        randomBot = sendLevel
    
//        playerPlist()
//        playerP1 = checkPLayer
        print("P1->>>>>\(playerP1)")
        p1 = UIImageView(image: UIImage(named: playerP1))
//        p2 = UIImageView(image: UIImage(named: ""))
        playerWidth  = 35
        startPlayerX = ((leftRim!/2)-(p1.frame.size.width/2))-leftRim!
        startPlayerY = board.frame.size.height-((board.frame.size.height/10)/2)-(playerWidth/2)
        startPlayer2X = ((leftRim!/2)-(p2.frame.size.width/2))-leftRim!
//        print("StartX\(startPlayerX)")
//        print("StartY\(startPlayerY)")
//        print("Start2X\(startPlayer2X)")
//        print("leftRim\(leftRim!/2)")
//        print("p2.frame\(p2.frame.size.width/2)")
//        print("p1.frame\(p1.frame.size.width/2)")
        sendImageData()
        p1.frame = CGRect(x: startPlayerX, y: startPlayerY, width: playerWidth, height: playerWidth)
        p2.frame = CGRect(x: startPlayer2X-17.5, y: startPlayerY, width: playerWidth, height: playerWidth)
        
        
        
        p1.hidden = true
        p2.hidden = true
        
        board.addSubview(p1)
        board.addSubview(p2)
//        labelQuestion.font = UIFont(name: "Lomoor", size: 17.0)
//        buttonAnswerA.
        print("getLevelNumber---\(getLevelNumber)")
//        Level Question
//        stringPlist()
        
//        waitFriendImage.hidden = false
        
//        false
        enableAllButton(true)
        
        waitFriendImage.frame = CGRect(x: 110, y: 900, width: 100, height: 100)
        waitFriendImage.hidden = true
        self.view.addSubview(waitFriendImage)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("getLevelNumber2---\(getLevelNumber)")
//        getLevelNumber = getValue.setLevel
        let sendLevel = Level(levelNumber: getLevelNumber)
        level = sendLevel
        stringPlist()
        
    }
    
    @IBAction func connectMultiplayer(sender: AnyObject) {
        if  appDelegate.mpcHandler.session != nil{
            appDelegate.mpcHandler.setupBrowser()
            appDelegate.mpcHandler.browser.delegate = self
            self.presentViewController(appDelegate.mpcHandler.browser, animated: true, completion: nil)
            
        }
    }
    
    func peerChangedStateWithNotification(notification:NSNotification) {
        let userInfo = NSDictionary(dictionary: notification.userInfo!)
        let state = userInfo.objectForKey("state") as! Int
        if state != MCSessionState.Connecting.rawValue {
            let senderPeerId:MCPeerID = userInfo["peerID"] as! MCPeerID
            var senderDisplayName = senderPeerId.displayName
            var myDisplayName = appDelegate.mpcHandler.peerID.displayName

            self.navigationItem.title = "Connected"
//            myDisplayName = "Player1"
//            senderDisplayName = "Players2"
            
            if myDisplayName < senderDisplayName {
                sendImageData()
                buttonDice.hidden = false
                //            buttonDice.enabled = false
                 //            true
                enableAllButton(false)
                hiddenWaitFriendImage(true)
                
            }
            else {
                buttonDice.hidden = true
                //            buttonDice.enabled = false
                //            false
                enableAllButton(true)
                hiddenWaitFriendImage(false)
                
            }
        }
        
        if state == MCSessionState.NotConnected.rawValue {
            self.navigationItem.title = "Disconnected"
            print(state)
            let alertView = UIAlertController(title: "Blutooth Disconnect", message: "กรุณาออกจากเกมและเข้าเล่นใหม่", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertView, animated: true, completion: nil)
            alertView.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.Cancel, handler: {(alertView: UIAlertAction) in self.sendAlertView()}))
        }
    }
    
    func handleReceivedDataWithNotification(notification:NSNotification) {
        let userInfo = notification.userInfo! as Dictionary
        let receivedData:NSData = userInfo["data"] as! NSData
        let message = (try! NSJSONSerialization.JSONObjectWithData(receivedData, options: NSJSONReadingOptions.AllowFragments)) as! NSDictionary
//        let senderPeerId:MCPeerID = userInfo["peerID"] as! MCPeerID
//        let senderDisplayName = senderPeerId.displayName
//        view.addSubview(waitFriendImage)
        if sequence == 0 {
            sequence = 2
//            switchAccountIcon()
            let getPlayerP2 = (message.objectForKey("imagePlayerP1") as? String)!
            print("getPlayer->.....\(getPlayerP2)")
            playerP2 = getPlayerP2
            print("P2->>>>>\(playerP2)")
            p2 = UIImageView(image: UIImage(named: playerP2))
            p2.frame = CGRect(x: startPlayer2X-17.5, y: startPlayerY, width: playerWidth, height: playerWidth)
//            p2.hidden = false
            board.addSubview(p2)
            p2.hidden = true
            
            let bigImagePlayer = (message.objectForKey("bigImage") as? String)!
            getBigImage = bigImagePlayer
            print("P23456789dsad->>>>>\(getBigImage)")
            waitFriendImage = UIImageView(image: UIImage(named: getBigImage))
            waitFriendImage.frame = CGRect(x: 110, y: 900, width: 100, height: 100)
            self.view.addSubview(waitFriendImage)
//            waitFriendImage.hidden = true
        }

        if let newScore = (message.objectForKey("score") as? Int) {
            let roll = (message.objectForKey("roll") as? Int)!
            friendDice = roll
            print("fridendDice\(friendDice)")
            //enableAllButton(false)
            if friendDice == 0 {
                playerIndex = 1
                switchAccount()
            }
            else {
                playerIndex = 1
                diceNumber = friendDice
                sumRandomdice(sender: diceNumber)
                botPlay()
                NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(2.0), target: self, selector: "sendImageData", userInfo: nil, repeats: false)
//                sendImageData()
            }
            
        }
    }
    
    func sendData() {
        //        enableAllButton(true)
        //----(1)send
        p2.hidden = false
        waitFriendImage.hidden = true
        sendImageData()
        let messageDict = ["score": myScore, "roll": diceNumber ,"rollButton": 1]
        let messafeData = try? NSJSONSerialization.dataWithJSONObject(messageDict, options: NSJSONWritingOptions.PrettyPrinted)
        var error:NSError?
        do {
            try appDelegate.mpcHandler.session.sendData(messafeData!, toPeers: appDelegate.mpcHandler.session.connectedPeers, withMode: MCSessionSendDataMode.Reliable)
        } catch let error1 as NSError {
            error = error1
        }
        if error != nil {
            print("error: \(error?.localizedDescription)")
            let alertView = UIAlertController(title: "Pause Game", message: "คุณต้องการออกจากเกมหรือไม่", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertView, animated: true, completion: nil)
            alertView.addAction(UIAlertAction(title: "ใช่", style: UIAlertActionStyle.Cancel, handler: {(alertView: UIAlertAction) in
                self.sendAlertView()
            }))
            alertView.addAction(UIAlertAction(title: "เล่นต่อ", style: UIAlertActionStyle.Default, handler: nil))
        }
        
    }
    
    func sendImageData() {
        print("player1------->2\(playerP1)")
        print("player123456------->2\(bigPlayerImage)")
        let messageDict = ["imagePlayerP1": playerP1, "bigImage": bigPlayerImage]
        let messafeData = try? NSJSONSerialization.dataWithJSONObject(messageDict, options: NSJSONWritingOptions.PrettyPrinted)
        var error:NSError?
        do {
            try appDelegate.mpcHandler.session.sendData(messafeData!, toPeers: appDelegate.mpcHandler.session.connectedPeers, withMode: MCSessionSendDataMode.Reliable)
        } catch let error1 as NSError {
            error = error1
        }
        if error != nil {
            print("error: \(error?.localizedDescription)")
        }

    }
    
    @IBAction func randomButton(sender: AnyObject) {
//        if sequence == 0 {
////            sequence = 1
////            switchAccountIcon()
//        }
        buttonDice.hidden = true
//        buttonDice.enabled = false
        play()
    }
    
    func play() {
        //random
        p1.hidden = false
        random()
        sendData()
        timeStart()
    }
    
    //Timer
    func timeStart() {
        time = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "timeRunning", userInfo: nil, repeats: true)
    }
    
    func timeStop() {
        timer?.invalidate()
    }
    
    func checkLadder() {
        // chcek ladder
        let findJump = jumpTo.indexOf(sumNumberDices[playerIndex])
        let findDown = downTo.indexOf(sumNumberDices[playerIndex])
        if findJump != nil {
            diceNumber = jumpToDes[findJump!]
            sumRandomdice(sender: diceNumber)
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
        if playerIndex == 1 {
            self.p1.hidden = false
        }
        else if playerIndex == 0 {
            self.p2.hidden  = false
        }
    }
    
    func hiddenP() {
        if playerIndex == 0 {
            self.p1.hidden = true
        }
        else if playerIndex == 1 {
            self.p2.hidden  = true
        }
    }
    
    //    6,19,20,18,12,23,19
    func showWarpGates() {
        if playerIndex == 0 {
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
        else if playerIndex == 1 {
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
        if playerIndex == 0 {
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
            case -18: blackHole70.hidden = false
                break
            default : blackHole97.hidden = false
                break
            }
        }
        else if playerIndex == 1 {
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
            case -18: blackHole70.hidden = false
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
        blackHole85.hidden = true
        blackHole97.hidden = true
    }
    
    func timeRunning() {
        time++
        if time > diceNumber {
            timeStop()
            NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1), target: self, selector: "checkLadderAndSwitchPlayer", userInfo: nil, repeats: false)
        }
        else {
            selectPlayer()
        }
    }
    
    func checkLadderAndSwitchPlayer() {
        checkLadder()
        switchAccount()
    }
    
    func selectPlayer() {
        walk(checkAccount())
        walking = ((sumNumberDices[playerIndex] - diceNumber)+time)
        if walking >= 100 {
            endGame()
        }
    }
    
    func walk(player: UIImageView) {
        calculateDirection(player)
        calculateWalking(time)
    }
    
    func jumpTo(player: UIImageView) {
        let start = sumNumberDices[playerIndex]+abs(diceNumber)
        let end = Int(sumNumberDices[playerIndex])
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
        levelsTable[playerIndex] = levelsTableEnd
        if end >= 100 {
            endGame()
        }
    }
    
    func checkAccount() -> UIImageView {
        var p:UIImageView?
        if playerIndex == 0{
            p = p1
        }
        else if playerIndex == 1 {
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
            if levelsTable[playerIndex]%2 == 1 {
                leftToright(player)
            }
            else {
                up(player)
            }
        }
        else if player.frame.origin.x > rightRim {
            if levelsTable[playerIndex]%2 == 0 {
                rightToLeft(player)
            }
            else {
                up(player)
            }
        }
        else {
            if levelsTable[playerIndex]%2 == 0 {
                rightToLeft(player)
            }
            else {
                leftToright(player)
            }
        }
    }
    
    func calculateWalking(step:Int) {
        walking = ((sumNumberDices[playerIndex] - diceNumber)+step)
        levelsTable[playerIndex] = getLevelTable(walking)
    }
    
    func switchAccount() {
        //switch account
        if !enderGame {
            playerIndex = ( playerIndex == 1 ) ? 0 : 1
            if playerIndex == 1{
                buttonDice.hidden = true
                buttonDice.enabled = false
//                false
                correctAnswerButton(false)
                enableAllButton(true)
                hiddenWaitFriendImage(false)
            }
            else if playerIndex == 0{
                stringPlist()
                buttonDice.enabled = true
//                true
                correctAnswerButton(true)
                enableAllButton(false)
                hiddenWaitFriendImage(true)
            }
        }
    }
    
    func switchAccountIcon() {
//        if sequence == 1 {
//            p1.image = UIImage(named: playerP1)
//            p2.image = UIImage(named: playerP2)
//            waitFriendImage = UIImageView(image: UIImage(named: playerP2))
//        }
//        else if sequence == 2 {
//            p1.image = UIImage(named: playerP2)
//            p2.image = UIImage(named: playerP1)
//            waitFriendImage = UIImageView(image: UIImage(named: playerP1))
//        }
    }
    
    func botPlay() {
        buttonDice.hidden = true
//        buttonDice.enabled = false
//        hiddenWaitFriendImage(true)
        p2.hidden = false
        timeStart()
    }
    
    func endGame() {
        enderGame = true
        timeStop()
//        buttonDice.hidden = true
        buttonDice.enabled = false
//        hiddenWaitFriendImage(true)
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
                print("Player \(i+1) win!!!")
                NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0), target: self, selector: "alertViewGetWin", userInfo: nil, repeats: false)
                break
            }
        }
    }
    
    func alertViewGetWin() {
        for _ in 0...1{
            if playerIndex == 0{
                let alertView = UIAlertController(title: "Player \(1) win!!!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                self.presentViewController(alertView, animated: true, completion: nil)
                alertView.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.Cancel, handler: nil))
                let imageAlertView = UIImageView(frame: CGRectMake(89, -150, 100, 100))
                imageAlertView.image = UIImage(named: "dice1.png")
                alertView.view.addSubview(imageAlertView)
                print("Player \(1) win!!!")
            }
            else if playerIndex == 1{
                let alertView = UIAlertController(title: "Player \(2) win!!!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                self.presentViewController(alertView, animated: true, completion: nil)
                alertView.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.Cancel, handler: nil))
                let imageAlertView = UIImageView(frame: CGRectMake(89, -150, 100, 100))
                imageAlertView.image = UIImage(named: "dice1.png")
                alertView.view.addSubview(imageAlertView)
                print("Player \(2) win!!!")

            }
            
            //                alertView.addAction(UIAlertAction(title: "ใช่", style: UIAlertActionStyle.Cancel, handler: {(alertView: UIAlertAction) in self.sendAlertView()}))
            //                alertView.addAction(UIAlertAction(title: "เล่นต่อ", style: UIAlertActionStyle.Default, handler: {(alertView: UIAlertAction) in self.newGame()}))
           
        }
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
    }
    
    func sumRandomdice(sender sum: Int) -> Int {
        sumNumberDices[playerIndex] = sumNumberDices[playerIndex] + diceNumber
        print(" Player: \(playerIndex+1), sumNumberDice = \(sumNumberDices[playerIndex])")
        return sumNumberDice
    }
    
    func random() {
//        diceNumber = 7
        diceNumber = randomNumber(minX: 1, maxX: UInt32(6))
        image = UIImage(named: "dice\(diceNumber).png")!
        imageView = UIImageView(image: image)
        imageView!.frame = CGRect(x: 551, y: 851, width: 100, height: 100)
        view.addSubview(imageView!)
        buttonDice!.setBackgroundImage(image, forState: UIControlState.Normal)
        sumRandomdice(sender: diceNumber)
    }
    
    func randomQuestions() {
        randomQuestion = randomNumber(minX:0, maxX:UInt32(level.questionArray.count-1))
    }
    
    func randomPlayer() {
        randomPlayerBot = randomNumber(minX: 0, maxX:UInt32(randomBot.randomPlayer.count-1))
    }
    
    func randomNumber(minX minX:UInt32, maxX:UInt32) -> Int {
        let result = (arc4random() % (maxX - minX + 1)) + minX
        return Int(result)
    }
    
    func stringPlist() {
        randomQuestions()
        //1
        assert(level.questionArray.count > 0, "no level loaded")
        assert(level.answers.count > 0, "no answer loaded")
        
        //2
        let questionPair = level.questionArray[randomQuestion]
        let answerQuestion = level.answers[randomQuestion]
        
        //3
        question = questionPair[0] as! String
        answerA = questionPair[1] as! String
        answerB = questionPair[2] as! String
        answerC = questionPair[3] as! String
        answerD = questionPair[4] as! String
        checkAnswer = answerQuestion[0] as! String
        
        //4
        let anagram1length = question.characters.count
        let anagram2length = answerA.characters.count
        let anagram3length = answerB.characters.count
        let anagram4length = answerC.characters.count
        let anagram5length = answerD.characters.count
        
        
        //5
        print("phrase1[\(anagram1length)]: \(question)")
        print("phrase2[\(anagram2length)]: \(answerA)")
        print("phrase3[\(anagram3length)]: \(answerB)")
        print("phrase4[\(anagram4length)]: \(answerC)")
        print("phrase5[\(anagram5length)]: \(answerD)")
        
        
        labelQuestion.text = question
        buttonAnswerA.setTitle("\(answerA)", forState: .Normal)
        buttonAnswerB.setTitle("\(answerB)", forState: .Normal)
        buttonAnswerC.setTitle("\(answerC)", forState: .Normal)
        buttonAnswerD.setTitle("\(answerD)", forState: .Normal)
        correctAnswerButton(true)
        
    }
    
    func enableAllButton(state:Bool) {
        buttonAnswerA.hidden = state
        buttonAnswerB.hidden = state
        buttonAnswerC.hidden = state
        buttonAnswerD.hidden = state
        labelQuestion.hidden = state
    }
    
    func hiddenWaitFriendImage(state:Bool) {
        waitFriendImage.hidden = state
        friendTurnImage.hidden = state
        pleaseWait.hidden = state
        buttonDice.hidden = true
        buttonDice.enabled = false
        imageView.hidden = state
    }
    
    func correctAnswerButton(state: Bool) {
            buttonAnswerA.enabled = state
            buttonAnswerB.enabled = state
            buttonAnswerC.enabled = state
            buttonAnswerD.enabled = state
    }
    @IBAction func check(button: UIButton) {
        if button == buttonAnswerA {
            if answerA == checkAnswer{
                print("answer A pressed")
                correct = true
            }
            else{
                print("not answer")
                correct = false
            }
        }
        else if button == buttonAnswerB {
            if answerB == checkAnswer{
                print("answer B pressed")
                correct = true
            }
            else{
                print("not answer")
                correct = false
            }
        }
        else if button == buttonAnswerC {
            if answerC == checkAnswer{
                print("answer C pressed")
                correct = true
            }
            else{
                print("not answer")
                correct = false
            }
        }
        else if button == buttonAnswerD {
            if answerD == checkAnswer{
                print("answer D pressed")
                correct = true
            }
            else{
                print("not answer")
                correct = false
            }
        }
        self.view.addSubview(buttonDice!)
//        false
//        enableAllButton(true)
        correctAnswerButton(false)
        if correct {
            buttonDice.hidden = false
            buttonDice.enabled = true
            buttonDice!.addTarget(self, action: "randomButton:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        else {
            buttonDice.enabled = false
            diceNumber = 0
            sendData()
            switchAccount()
        }
    }
    
    func sendAlertView() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController) {
        appDelegate.mpcHandler.browser.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController) {
        appDelegate.mpcHandler.browser.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func playerPlist() {
        randomPlayer()
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
