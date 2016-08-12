//
//  ViewController.swift
//  Quit!
//
//  Created by Gabriel Allen on 8/10/16.
//  Copyright © 2016 Gabriel Allen. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var cigNumLabel: UILabel!
    @IBOutlet weak var cashWastedLabel: UILabel!
    @IBOutlet weak var timeLostLabel: UILabel!
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }
    @IBAction func unwindToViewControllerone (sender: UIStoryboardSegue){
        prepareCashAudios()
    }
    
    var cig = NSUserDefaults.standardUserDefaults()
    
    var coin = NSUserDefaults.standardUserDefaults()
    
    
    var cash = AVAudioPlayer()
    var cashSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cash", ofType: "mp3")!)
    func prepareCashAudios() {
        
        
        // Preperation
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
            
            
            //play
        }
        do {
            cash = try AVAudioPlayer(contentsOfURL: cashSound)
        } catch _{
        }
        
        cash.prepareToPlay()
        cash.play()
        
    }

    

    var cigNumber = 0.0
    var moneyWasted: Double = 0.0
    var timeLost = 0.0
    
    func getCoin() {
        let coinNum = coin.integerForKey("coinKey")
        coinsLabel.text = "x\(coinNum)"
    }
    
    func calcTime() {
        var totalTimeLost = cig.integerForKey("cigKey") * 11
        
        let daysLost = totalTimeLost/1440
        totalTimeLost -= daysLost * 1440
        
        let hoursLost = totalTimeLost/60
        totalTimeLost -= hoursLost * 60
        
        let minsLost = totalTimeLost
        
        let stringDays = String(format: "%01d", daysLost)
        let stringHours = String(format: "%01d", hoursLost)
        let stringMins = String(format:"%01d", minsLost)
        
        if daysLost == 0 {
            timeLostLabel.text = "\(stringHours)h \(stringMins)m"
        }
        if hoursLost == 0 {
            timeLostLabel.text = "\(stringMins)m"
        }
        else if daysLost != 0 && hoursLost != 0{
        timeLostLabel.text = "\(stringDays)d \(stringHours)h \(stringMins)m"
        }
    }
    
    
    func calcMoney() {
        
        self.moneyWasted = Double(cig.integerForKey("cigKey")) * 0.38
        cashWastedLabel.text = "$\(moneyWasted)"

    }
    
    func calcCig() {
        
        cigNumLabel.text = String(cig.integerForKey("cigKey"))
                

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        calcTime()
        calcMoney()
        calcCig()
        getCoin()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

