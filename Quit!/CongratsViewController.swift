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
    
    
    let quotes = [
        "Man is not imprisoned by habit. Great changes in him can be wrought by crisis -- once that crisis can be recognized and understood.",
        "\"I count him braver who overcomes his desires than him who conquers his enemies; for the hardest victory is over self.\" -Aristotle",
        "\"The awareness that health is dependent upon habits that we control makes us the first generation in history that to a large extent determines its own destiny.\"Jimmy Carter",
        "\"With self-discipline most anything is possible.\" -Theodore Roosevelt"
        
    ]
    


    let gif1 = UIImage.gifWithName("gif1")
    let gif2 = UIImage.gifWithName("gif2")
    let gif3 = UIImage.gifWithName("gif3")
    let gif4 = UIImage.gifWithName("gif4")
    



    private func randomImage() -> UIImage {
        let images = [
            gif1,
            gif2,
            gif3,
            gif4
        ]
        let idx = Int(arc4random_uniform(UInt32(images.count)))

        return images[idx]!
        
        }
    
    private func randomQuote() -> String {
        let idx = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[idx]
    }
    
    private func setupView() {
        imageView.image = randomImage()

        quoteLabel.text = randomQuote()
    }


    
    func randCoin() {
        
        let randInt = drand48()
        
        let coinNum = coin.integerForKey("coinKey")
        
        if randInt <= 0.35 {
            addCoinLabel.text = "x 1"
            coin.setInteger(coinNum+1, forKey: "coinKey")
        }
        else if randInt <= 0.7 && randInt > 0.35 {
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
        else {
            addCoinLabel.text = "x 24"
            coin.setInteger(coinNum+24, forKey: "coinKey")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        randCoin()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        quoteLabel.setContentOffset(CGPointZero, animated: false)
    }

}