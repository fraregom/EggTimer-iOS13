//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    @IBOutlet weak var titleEggTimer: UILabel!
    @IBOutlet weak var barProgress: UIProgressView!
    var timer = Timer()
    var player: AVAudioPlayer!
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func timer(time: Int){
        timer.invalidate()
        barProgress.progress = 0.0
        let timeTarget: Int = time * 60
        var secondsPassed: Int = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            (Timer) in
                if secondsPassed < timeTarget {
                    secondsPassed += 1
                    self.barProgress.progress = Float(secondsPassed)/Float(timeTarget)
                } else {
                    Timer.invalidate()
                    self.titleEggTimer.text = "Done!"
                    self.playSound()
                }
            }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle
        self.titleEggTimer.text = sender.currentTitle
        
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
