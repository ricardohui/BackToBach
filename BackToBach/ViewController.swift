//
//  ViewController.swift
//  BackToBach
//
//  Created by Ricardo Hui on 29/3/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "mozart-piano", ofType: "mp3")
    var timer = Timer()
    @IBOutlet var volumeSlider: UISlider!
    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    @IBAction func volumeChanged(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    @IBOutlet var scrubber: UISlider!
    
    @IBAction func scrubberMoved(_ sender: Any) {
        player.currentTime = TimeInterval(scrubber.value)
    }
    
    @IBAction func stop(_ sender: Any) {
       player.pause()
        timer.invalidate()
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
         
        } catch{
            
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    
    
    @objc func updateScrubber(){
        scrubber.value = Float(player.currentTime)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            scrubber.maximumValue = Float(player.duration)
        } catch{
            
        }
    }


}

