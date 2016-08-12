//
//  CongratsViewController.swift
//  Quit!
//
//  Created by Gabriel Allen on 8/11/16.
//  Copyright © 2016 Gabriel Allen. All rights reserved.
//

import UIKit
import AVFoundation

class CongratsViewController: UIViewController {

    
    @IBOutlet weak var quoteLabel: UITextView!
    @IBOutlet weak var addCoinLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var coin = NSUserDefaults()
    
    var cash = AVAudioPlayer()
    var cashSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cash", ofType: "mp3")!)
    
    let quotes = [
        "Man is not imprisoned by habit. Great changes in him can be wrought by crisis -- once that crisis can be recognized and understood.",
        "\"I count him braver who overcomes his desires than him who conquers his enemies; for the hardest victory is over self.\" -Aristotle",
        "\"The awareness that health is dependent upon habits that we control makes us the first generation in history that to a large extent determines its own destiny.\"Jimmy Carter",
        "\"With self-discipline most anything is possible.\" -Theodore Roosevelt"
        
    ]
    
    let images = [
        "image1"
    ]
    

    
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


    func randCoin() {
        
        let randInt = drand48()
        
        let coinNum = coin.integerForKey("coinKey")
        
        if randInt <= 0.45 {
            addCoinLabel.text = "x 1"
            coin.setInteger(coinNum+1, forKey: "coinKey")
        }
        else if randInt <= 0.7 && randInt > 0.45 {
            addCoinLabel.text = "x 2"
            coin.setInteger(coinNum+2, forKey: "coinKey")
        }
        else if randInt > 0.7 && randInt <= 0.85 {
            addCoinLabel.text = "x 3"
            coin.setInteger(coinNum+3, forKey: "coinKey")
    }
        else if randInt > 0.85 && randInt < 0.92 {
            addCoinLabel.text = "x 4"
            coin.setInteger(coinNum+4, forKey: "coinKey")
        }
        else if randInt >= 0.92 && randInt <= 0.95 {
            addCoinLabel.text = "x 5"
            coin.setInteger(coinNum+5, forKey: "coinKey")
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        randCoin()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @IBAction func onNext(sender: UIButton) {
        setupView()
    }
    
    private func randomImage() -> UIImage {
        let idx = Int(arc4random_uniform(UInt32(images.count)))
        guard let image = UIImage(named: images[idx]) else { fatalError() }
        
        return image
    }
    
    private func randomQuote() -> String {
        let idx = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[idx]
    }
    
    private func setupView() {
        imageView.image = randomImage()
        quoteLabel.text = randomQuote()
    }

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
}