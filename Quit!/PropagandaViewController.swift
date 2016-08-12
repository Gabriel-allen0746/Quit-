//
//  PropagandaViewController.swift
//  Quit!
//
//  Created by Gabriel Allen on 8/11/16.
//  Copyright © 2016 Gabriel Allen. All rights reserved.
//

import UIKit
import AVFoundation


class PropagandaViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UITextView!

    
    @IBOutlet weak var imageView: UIImageView!
    var cig = NSUserDefaults.standardUserDefaults()
    
    var gunshot = AVAudioPlayer()
    var gunSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gunshot", ofType: "mp3")!)
    
    var cash = AVAudioPlayer()
    var cashSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cash", ofType: "mp3")!)

    
    let quotes: [String] = [
        "Smoking causes 1 in every 5 deaths in the U.S. every year.",
        "Every cigarette you smoke reduces your expected life span by 11 minutes.",
        "A single cigarette contains over 4,800 chemicals, 69 of which are known to cause cancer.",
        "The average smoker in the U.S. spends US$1,500 to US$3,300 a year.",
        "Exposure to Secondhand smoke causes nearly 50,000 deaths each year in the U.S. alone",
        "About 69% of smokers want to quit completely.",
        "The first European who learned to smoke from the natives was arrested back home because people thought he was possessed by the devil.",
        "Smoking near Apple computers voids the warranty.",
        "Over 30% of cancer could be prevented by avoiding tobacco and alcohol, having a healthy diet and physical activity.",
        "Smoking makes your hair turn gray faster, a study found.",
        "Smoking makes the risk of a heart attack 200% to 400% greater than that of nonsmokers.",
        "Smoking makes breasts sag faster than normal by breaking down a protein in the skin called elastin, which gives youthful skin its elastic appearance and supports the breast.",
        "If the average NYC smoker gave up smoking and instead invested the money in the SandP500, in 10 years, would have US$52,000.",
        "One Hookah Tobacco Smoking Session Delivers 25 Times the Tar of a Single Cigarette.",
        "Urea, the main ingredient in urine, is added to cigarettes to enhance their flavor.",
        "The world's largest producer of cigarettes is a company owned by the Chinese government.",
        "\"Smoking kills half of all lifetime smokers.\" -Dr. Alex Bobak",
        "\"A cigarette is the only consumer product which when used as directed kills its consumer.\" - Dr. Gro Brundtland",
        "\"The true face of smoking is disease, death and horror - not the glamour and sophistication the pushers in the tobacco industry try to portray.\" -David Byrne",
        "\"Ninety-nine percent of the failures come from people who have the habit of making excuses.\" -George Washington Carver",
        "Do you want to spend the rest of your life fighting a stupid addiction to a stupid thing that doesn't even really give you a good buzz?",
        "\"Smoking helps you lose weight - one lung at a time!\" -Alfred E. Neuman",
        "\"Smoking kills. If you're killed, you've lost a very important part of your life.\" -Brooke Shields"
    ]
    
    let images = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image7",
        "image8"
    
    ]
    
    @IBAction func addCigAction(sender: AnyObject) {
        let cigNum = cig.integerForKey("cigKey")
        cig.setInteger(cigNum+1, forKey: "cigKey")
        
        prepareGunAudios()



    }
    
    func prepareGunAudios() {
        
        
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
            gunshot = try AVAudioPlayer(contentsOfURL: gunSound)
        } catch _{
        }
        
        gunshot.prepareToPlay()
        gunshot.play()

    }
    
    @IBAction func cashAction(sender: AnyObject) {
        prepareCashAudios()
    }
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        quoteLabel.setContentOffset(CGPointZero, animated: false)
    }

}
