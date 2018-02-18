//
//  SecondViewController.swift
//  Chernobyl Tours
//
//  Created by Maruska on 0802..2018.
//  Copyright © 2018 Soloeast. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var mapView: GMSMapView!
    //var mapView = GMSMapView()
    var locationManager = CLLocationManager();
    var currentLocation: CLLocation?
    

    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var location = locationManager.location?.coordinate
        
        cameraMoveToLocation(toLocation: location)
        
    }
    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
        }
    }
    
    override func loadView() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
       
        
        // arrayList to store all objects with info
        var modelMarkerArrayList = [ModelMarker]();
        // fill the arraylist with markers
        setGeoInMap(modelMarkerArrayList: &modelMarkerArrayList)
        
        // kiev koordinates
        let camera = GMSCameraPosition.camera(withLatitude: 50.4501,
                                              longitude: 30.5234,
                                              zoom: 14)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        //initializeTheLocationManager()

        // enabling geolocation button

        
        // display markers
        for ModelMarker in modelMarkerArrayList{
            let marker = GMSMarker()
            // marker position
            marker.position = CLLocationCoordinate2DMake(ModelMarker.latitude, ModelMarker.longitude)
            // marker icon
            marker.icon = self.scaleImage(image: UIImage(named: ModelMarker.bitmapMarkerId)!, scaledToSize: CGSize(width: 50.0, height: 68.0))
            //GMSGroundOverlay.init(position: marker.position, icon: <#T##UIImage?#>, zoomLevel: <#T##CGFloat#>) // for radius
            marker.map = mapView
            
        }
    
        
        view = mapView
    }
    
    func scaleImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        //image.draw(in: CGRectMake(0, 0, newSize.width, newSize.height))
        image.draw(in: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: newSize.width, height: newSize.height))  )
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func setGeoInMap(modelMarkerArrayList : inout [ModelMarker])
    {
        // method to fill an input arrayList with object data
        // first points check point
        modelMarkerArrayList.append(ModelMarker(latitude: 50.45148595,
                                                longitude: 30.52208215,
                                                title: NSLocalizedString("tour_starting_point", comment: "Tour starting point"),
                                                description: NSLocalizedString("tour_starting_point_description", comment: "Tour starting point"),
                                                bitmapId: "data",
                                                radius: 50,
                                                bitmapMarkerId: "pin_1",
                                                audioId: "tour_starting_point"));// Tour starting point
        modelMarkerArrayList.append(ModelMarker(latitude: 50.45046123,
                                                longitude: 30.5239436,
                                                title: NSLocalizedString("kreschatic_street", comment: "Kreschatik street"),
                                                description: NSLocalizedString("kreshatik_street_description", comment : "Kreschatik street"),
                                                bitmapId: "data1",
                                                radius: 75,
                                                bitmapMarkerId: "pin_2",
                                                audioId: "kres_street"));// Kreschatik street
        modelMarkerArrayList.append(ModelMarker(latitude: 50.45846028,
                                                longitude: 30.52656412,
                                                title: NSLocalizedString("podol", comment : "Podol"),
                                                description: NSLocalizedString("podol_description", comment : "Podol"),
                                                bitmapId: "data2",
                                                radius: 100,
                                                bitmapMarkerId: "pin_3",
                                                audioId: "podol"));// Podol
        modelMarkerArrayList.append(ModelMarker(latitude: 50.60230732,
                                                longitude: 30.45289993,
                                                title: NSLocalizedString("novi_petrivtsi", comment : "Novi Petrivtsy"),
                                                description: NSLocalizedString("novi_petrivtsi_description", comment : "Novi Petrivtsy"),
                                                bitmapId: "data3",
                                                radius: 100,
                                                bitmapMarkerId: "pin_4",
                                                audioId: "novi"))// Novi Petrivtsy
        modelMarkerArrayList.append(ModelMarker(latitude: 50.77636424,
                                                longitude: 30.3228879,
                                                title: NSLocalizedString("dymer", comment : "Dymer"),
                                                description: NSLocalizedString("dymer_description", comment : "Dymer"),
                                                bitmapId: "data4",
                                                radius: 400,
                                                bitmapMarkerId: "pin_5",
                                                audioId: "dymer"));// Dymer
        modelMarkerArrayList.append(ModelMarker(latitude: 50.80640933, longitude: 30.15102267,
                                                title: NSLocalizedString("katyuzhanka", comment : "Katyuzhanka"),
                                                description: NSLocalizedString("katyachanka_description", comment : "Katyuzhanka"),
                                                bitmapId: "data5",
                                                radius: 400,
                                                bitmapMarkerId: "pin_6",
                                                audioId: "kat"));// Katyuzhanka
        modelMarkerArrayList.append(ModelMarker(latitude: 50.91928863,
                                                longitude: 29.90091741,
                                                title: NSLocalizedString("ivankiv", comment : "Ivankiv"),
                                                description: NSLocalizedString("ivankiv_description", comment : "Ivankiv"),
                                                bitmapId: "data6",
                                                radius: 400,
                                                bitmapMarkerId: "pin_7",
                                                audioId: "ivankiv"));// Ivankiv
        modelMarkerArrayList.append(ModelMarker(latitude: 51.11254837,
                                                longitude: 30.12176514,
                                                title: NSLocalizedString("dityatki_check_point", comment : "Dityatki Check Point"),
                                                description: NSLocalizedString("dityatki_check_point_description", comment : "Dityatki Check Point"),
                                                bitmapId: "data7",
                                                radius: 500,
                                                bitmapMarkerId: "pin_8",
                                                audioId: "dit"));// Dityatki Check Point
        modelMarkerArrayList.append(ModelMarker(latitude: 51.12256969,
                                                longitude: 30.12187243,
                                                title: NSLocalizedString("thirty_k_zone", comment : "30k zone"),
                                                description: NSLocalizedString("thirty_k_zone_description", comment : "30k zone"),
                                                bitmapId: "data8",
                                                radius: 500,
                                                bitmapMarkerId: "pin_9",
                                                audioId: "thirty_k_zone"));// 30k zone
        modelMarkerArrayList.append(ModelMarker(latitude: 51.253804,
                                                longitude: 30.184443,
                                                title: NSLocalizedString("zalesye_village", comment : "Zalesye Village"),
                                                description: NSLocalizedString("zalesye_village_description", comment : "Zalesye Village"),
                                                bitmapId: "data9",
                                                radius: 350,
                                                bitmapMarkerId: "pin_10",
                                                audioId: "zal"));// Zalesye Village
        // ten point check point
        modelMarkerArrayList.append(ModelMarker(latitude: 51.26497619,
                                                longitude: 30.20884037,
                                                title: NSLocalizedString("chornobyl", comment : "Chornobyl"),
                                                description: NSLocalizedString("chornobyl_description", comment : "Chornobyl"),
                                                bitmapId: "data10",
                                                radius: 500,
                                                bitmapMarkerId: "pin_11",
                                                audioId: "chornobyl"));// Chornobyl
        modelMarkerArrayList.append(ModelMarker(latitude: 51.27234674,
                                                longitude: 30.22422016,
                                                title: NSLocalizedString("trumpeting_angel_of_chornobyl", comment : "Trumpeting Angel of Chernobyl"),
                                                description: NSLocalizedString("trumpeting_angel_of_chornobyl_description", comment : "Trumpeting Angel of Chernobyl"),
                                                bitmapId: "data11",
                                                radius: 300,
                                                bitmapMarkerId: "pin_12",
                                                audioId: "trumpeting"));// Trumpeting Angel of Chernobyl
        modelMarkerArrayList.append(ModelMarker(latitude: 51.28024628,
                                                longitude: 30.20818055,
                                                title: NSLocalizedString("monuments_to_liquidator", comment : "Monument to the liquidators"),
                                                description: NSLocalizedString("monuments_to_liquidator_description", comment : "Monument to the liquidators"),
                                                bitmapId: "data12",
                                                radius: 300,
                                                bitmapMarkerId: "pin_13",
                                                audioId: "monument"));// Monument to the liquidators
        modelMarkerArrayList.append(ModelMarker(latitude: 51.28688467,
                                                longitude: 30.20294622,
                                                title: NSLocalizedString("robots", comment : "Robots"),
                                                description: NSLocalizedString("robots_description", comment : "Robots"),
                                                bitmapId: "data13",
                                                radius: 250,
                                                bitmapMarkerId: "pin_14",
                                                audioId: "robots"));// Robots
        modelMarkerArrayList.append(ModelMarker(latitude: 51.27269577,
                                                longitude: 30.23734152,
                                                title: NSLocalizedString("elijah_church", comment : "Elijah church"),
                                                description: NSLocalizedString("elijah_church_description", comment : "Elijah church"),
                                                bitmapId: "data14",
                                                radius: 250,
                                                bitmapMarkerId: "pin_15",
                                                audioId: "st_elijah"));// Elijah church
        modelMarkerArrayList.append(ModelMarker(latitude: 51.304720,
                                                longitude: 30.064399,
                                                title: NSLocalizedString("radar_duga", comment : "Radar duga"),
                                                description: NSLocalizedString("radar_duga_description", comment : "Radar duga"),
                                                bitmapId: "data15",
                                                radius: 500,
                                                bitmapMarkerId: "pin_16",
                                                audioId: "radar_duga"));// Radar duga
        modelMarkerArrayList.append(ModelMarker(latitude: 51.35342519,
                                                longitude: 30.12482285,
                                                title: NSLocalizedString("kopachi_village", comment : "Kopachi Village"),
                                                description: NSLocalizedString("kopachi_village_description", comment : "Kopachi Village"),
                                                bitmapId: "data16",
                                                radius: 600,
                                                bitmapMarkerId: "pin_17",
                                                audioId: "kopachi"));// Kopachi Village
        modelMarkerArrayList.append(ModelMarker(latitude: 51.37854448,
                                                longitude: 30.11360049,
                                                title: NSLocalizedString("first_part_of_reactor", comment : "1st Part nuclear Power Plant"),
                                                description: NSLocalizedString("first_part_of_reactor_description", comment : "1st Part nuclear Power Plant"),
                                                bitmapId: "data17",
                                                radius: 300,
                                                bitmapMarkerId: "pin_18",
                                                audioId: "first_part_nuclear"));// 1st Part nuclear Power Plant
        modelMarkerArrayList.append(ModelMarker(latitude: 51.39031566,
                                                longitude: 30.0938648,
                                                title: NSLocalizedString("chernobyl_new_safe_confinement", comment : "Chernobyl Safe Confinement"),
                                                description: NSLocalizedString("chernobyl_new_safe_confinement_description", comment : "Chernobyl Safe Confinement"),
                                                bitmapId: "data18",
                                                radius: 300,
                                                bitmapMarkerId: "pin_19",
                                                audioId: "chernobyl_new_safe"));// 19 Chernobyl Safe Confinement
        modelMarkerArrayList.append(ModelMarker(latitude: 51.39129981,
                                                longitude: 30.10875911,
                                                title: NSLocalizedString("second_part_power_part", comment : "second part power plant"),
                                                description: NSLocalizedString("second_part_power_plant", comment : "second part power plant"),
                                                bitmapId: "data19",
                                                radius: 250,
                                                bitmapMarkerId: "pin_20",
                                                audioId: "second_part_power_plant"));// second part power plant
        // twenty point check point
        modelMarkerArrayList.append(ModelMarker(latitude: 51.39486798,
                                                longitude: 30.06919384,
                                                title: NSLocalizedString("pripyat_town", comment : "Pripyat town"),
                                                description: NSLocalizedString("pripyat_town_descriptuion", comment : "Pripyat town"),
                                                bitmapId: "data20",
                                                radius: 400,
                                                bitmapMarkerId: "pin_21",
                                                audioId: "pripyat_town"));//Pripyat town
        modelMarkerArrayList.append(ModelMarker(latitude: 51.40798684,
                                                longitude: 30.06644726,
                                                title: NSLocalizedString("pripyat_river_point", comment : "Pripyat river point"),
                                                description: NSLocalizedString("pripyat_river_point_description", comment : "Pripyat river point"),
                                                bitmapId: "data21",
                                                radius: 300,
                                                bitmapMarkerId: "pin_22",
                                                audioId: "pripyat_river"));//Pripyat river point
        modelMarkerArrayList.append(ModelMarker(latitude: 51.40666174,
                                                longitude: 30.05779445,
                                                title: NSLocalizedString("centre", comment : "Center"),
                                                description: NSLocalizedString("centre_description", comment : "Center"),
                                                bitmapId: "data22",
                                                radius: 100,
                                                bitmapMarkerId: "pin_23",
                                                audioId: "centre"));//Center
        modelMarkerArrayList.append(ModelMarker(latitude: 51.40762545,
                                                longitude: 30.05620122,
                                                title: NSLocalizedString("ferris_wheel", comment : "Ferris wheel"),
                                                description: NSLocalizedString("ferris_wheel_description", comment : "Ferris wheel"),
                                                bitmapId: "data23",
                                                radius: 100,
                                                bitmapMarkerId: "pin_24",
                                                audioId: "ferris_wheel"));//Ferris wheel
        modelMarkerArrayList.append(ModelMarker(latitude: 51.41031571,
                                                longitude: 30.05469918,
                                                title: NSLocalizedString("stadium_avangard", comment : "Stadium avangard"),
                                                description: NSLocalizedString("stadium_avangard_description", comment : "Stadium avangard"),
                                                bitmapId: "data24",
                                                radius: 200,
                                                bitmapMarkerId: "pin_25",
                                                audioId: "stadium_avangard"));//Stadium avangard
        modelMarkerArrayList.append(ModelMarker(latitude: 51.40670189,
                                                longitude: 30.04939377,
                                                title: NSLocalizedString("swimming_pool", comment : "Swimming pool"),
                                                description: NSLocalizedString("swimming_pool_description", comment : "Swimming pool"),
                                                bitmapId: "data25",
                                                radius: 200,
                                                bitmapMarkerId: "pin_26",
                                                audioId: "swimming_pool"));//Swimming pool
        modelMarkerArrayList.append(ModelMarker(latitude: 51.40233816,
                                                longitude: 30.0425756,
                                                title: NSLocalizedString("jupiter_factory", comment : "Jupiter factory"),
                                                description: NSLocalizedString("jupiter_factory_description", comment : "Jupiter factory"),
                                                bitmapId: "data26",
                                                radius: 200,
                                                bitmapMarkerId: "pin_27",
                                                audioId: "jupiter_factory"));//Jupiter factory
        modelMarkerArrayList.append(ModelMarker(latitude: 51.40227123,
                                                longitude: 30.05153954,
                                                title: NSLocalizedString("police_station", comment : "Police station"),
                                                description: NSLocalizedString("police_station_description", comment : "Police station"),
                                                bitmapId: "data27",
                                                radius: 200,
                                                bitmapMarkerId: "pin_28",
                                                audioId: "police"));//Police station
    }
}

