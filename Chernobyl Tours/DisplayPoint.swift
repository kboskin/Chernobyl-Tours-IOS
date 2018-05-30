//
//  File.swift
//  Chernobyl Tours
//
//  Created by Maruska on 2202..2018.
//  Copyright © 2018 Soloeast. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class DisplayPoint: UIViewController {

    @IBOutlet weak var UITextView: UITextView!
    @IBOutlet weak var UIImageView: UIImageView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var audioPlayer : AVAudioPlayer!
    
    var textToGet : String = ""
    var imageNameToGet : String = ""
    var audioFileNameToGet : String = ""
    
    @IBAction func playButton(_sender : Any){
        if (audioPlayer != nil && !audioPlayer.isPlaying) {
            audioPlayer.play()
        }
        else {
            playSoundWith(fileName: audioFileNameToGet, fileExtension: "mp3")
        }
    }
    
    @IBAction func stopButton(_sender : Any){
        if (audioPlayer != nil) {
            audioPlayer.pause()
        }
    }
    
    @IBAction func resetButton(_sender : Any){
        if (audioPlayer != nil)
        {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }
    }
    
    func playSoundWith(fileName : String, fileExtension :  String) -> Void{
        let audioSourceURL : URL!
        audioSourceURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        if (audioSourceURL == nil)
        {
            print("Cant play this song")
        }else{
            // prepare audioplayer to play
            do {
                // load source
                audioPlayer = try AVAudioPlayer.init(contentsOf : audioSourceURL!)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                // update frequently
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
               
            } catch {
                print(error)
            }
        }
    }
    
    @objc func updateProgress(){
         progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
    }
    
    override func viewDidLoad() {
        
        // setting bar colour
        UIImageView.widthAnchor.constraint(equalTo: UIImageView.heightAnchor, multiplier: (UIImage(named : imageNameToGet)?.size.width)! / (UIImage(named : imageNameToGet)?.size.height)!).isActive = true
        navigationController?.navigationBar.barTintColor = UIColor(white: 0.9, alpha: 0.2)
        
    
        
        
        self.navigationController?.view.backgroundColor = UIColor.white
        // default blue color
        self.navigationController?.view.tintColor = UIColor(red: 0.0, green: 122/255, blue: 1.0, alpha: 1)
        
        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    
        
        
        // set text which is passed by props
        UITextView.text = self.textToGet
        UIImageView.image = UIImage(named : imageNameToGet)
        
        print("-------------------------------")
        print(textToGet)
        print(imageNameToGet)
        print(audioFileNameToGet)
    }
}
