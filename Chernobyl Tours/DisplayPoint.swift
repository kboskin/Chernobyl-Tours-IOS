//
//  File.swift
//  Chernobyl Tours
//
//  Created by Maruska on 2202..2018.
//  Copyright © 2018 Soloeast. All rights reserved.
//

import Foundation
import UIKit
class DisplayPoint: UIViewController {

    @IBOutlet weak var UITextView: UITextView!
    @IBOutlet weak var UIImageView: UIImageView!
    
    var textToGet : String = ""
    var imageNameToGet : String = ""
    var audioFileNameToGet : String = ""
    
    override func viewDidLoad() {
        
        // setting bar colour
        UIImageView.widthAnchor.constraint(equalTo: UIImageView.heightAnchor, multiplier: (UIImage(named : imageNameToGet)?.size.width)! / (UIImage(named : imageNameToGet)?.size.height)!).isActive = true
        navigationController?.navigationBar.barTintColor = UIColor(white: 0.9, alpha: 0.2)
        
    
        
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.view.tintColor = UIColor.orange
        
        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
      //self.navigationController?.navigationBar.backItem?.title = "Anything Else"
        
        
        // set text which is passed by props
        UITextView.text = self.textToGet
        UIImageView.image = UIImage(named : imageNameToGet)
        
        print("-------------------------------")
        print(textToGet)
        print(imageNameToGet)
        print(audioFileNameToGet)
    }
    
}
