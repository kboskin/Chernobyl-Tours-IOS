//
//  ModelMarker.swift
//  Chernobyl Tours
//
//  Created by Maruska on 1702..2018.
//  Copyright © 2018 Soloeast. All rights reserved.
//

import Foundation
import UIKit

class ModelMarker{
    var latitude, longitude, radius : Double!
    var bitmapMarkerId, title, description, audioId, bitmapId : String!
    
    init(latitude : Double, longitude : Double, title : String, description : String, bitmapId  : String,  radius : Double , bitmapMarkerId : String, audioId : String) {
        self.latitude = latitude;
        self.longitude = longitude;
        self.radius = radius;
        self.title = title;
        self.bitmapMarkerId = bitmapMarkerId;
        self.description = description;
        self.audioId = audioId;
        self.bitmapId = bitmapId;
    }
    
}

