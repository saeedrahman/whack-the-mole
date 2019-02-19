//
//  ViewController.swift
//  WhackTheMole
//
//  Created by Saeed Rahman on 18/2/2019.
//  Copyright © 2019 Saeed Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentScore = 0
    
    @IBOutlet weak var moleOutlet: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var mole: UIButton!
    
    var seconds = 20 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = "\(seconds)s" //This will update the label.
        
        if (seconds == 0) {
            timer.invalidate()
            moleOutlet.isEnabled = false
        }
    }
    
    @IBAction func moleButton(_ sender: Any) {
        currentScore += 1
        scoreLabel.text = String(currentScore)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        runTimer()
    }
}

