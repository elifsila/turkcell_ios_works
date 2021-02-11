//
//  UseMap.swift
//  DAY12
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//

import UIKit
import MapKit

struct MapInfo {
    var title = ""
    var subTitle = ""
    var lat:CLLocationDegrees = 0.0
    var long:CLLocationDegrees = 0.0
}

class UseMap: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var pins:[MapInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        pinResult()

    }
    
    func pinResult() {
        
        let loc1 = MapInfo(title: "Dolmabahçe Sarayı", subTitle: "Saray", lat: 41.0353399, long: 28.972105)
        
        let loc2 = MapInfo(title: "İstanbul Modern Sanat Müzesi", subTitle: "Modern Sanat Müzesi", lat: 41.029938, long: 28.973317)
        
        let loc3 = MapInfo(title: "Küçükpiyale", subTitle: "Küçükpiyale", lat: 41.038077, long: 28.96787)
        
        pins.append(loc1)
        pins.append(loc2)
        pins.append(loc3)
        
        mapPins()
    }

    
    func mapPins() {
        
        for item in pins {
            
            let pin = MKPointAnnotation()
            pin.title = item.title
            pin.subtitle = item.subTitle
            pin.coordinate = CLLocationCoordinate2D(latitude: item.lat, longitude: item.long)
            mapView.addAnnotation(pin)
            
        }
        
    }

}
