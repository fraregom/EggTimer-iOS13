//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    @IBOutlet weak var titleEggTimer: UILabel!
    var timer = Timer()
    
    func timer(time: Int){
        timer.invalidate()
        
        var secondsRemaining: Int = time // * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if secondsRemaining > 0 {
                    print ("\(secondsRemaining) seconds")
                    secondsRemaining -= 1
                } else {
                    Timer.invalidate()
                    self.titleEggTimer.text = "Done!"
                }
            }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        switch hardness {
            case "Soft":
                timer(time: eggTimes["Soft"]!)
            case "Medium":
                timer(time: eggTimes["Medium"]!)
            case "Hard":
                timer(time: eggTimes["Hard"]!)
            default:
                print("Error")
        }
        
    }
    

}
