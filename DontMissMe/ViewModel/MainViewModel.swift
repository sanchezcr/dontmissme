//
//  MainViewModel.swift
//  DontMissMe
//
//  Created by Michael Sanchez on 11/15/17.
//  Copyright © 2017 Michael Sanchez. All rights reserved.
//

import Foundation
import AVKit

class MainViewModel {
    
    var player: AVAudioPlayer?
    
    
    func playSound(index: Int) {
        
        guard let url = Bundle.main.url(forResource: String(index), withExtension: "caf") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSound(numberSounds: Int) {
        let index = random(numberSounds)
        playSound(index: index)
    }
    
    func showImage(numberImages: Int) -> UIImage {
        let index = random(numberImages)
        
        return UIImage(named: String(index) + ".jpg")!
    }
    
    func doCallMe() {
        let phoneNumber = "88296341"
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func random(_ n:Int) -> Int
    {
        return Int(arc4random_uniform(UInt32(n)))
    }
}
