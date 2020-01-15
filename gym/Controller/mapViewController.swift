//
//  mapViewController.swift
//  gym
//
//  Created by ac1ra on 15/01/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!

    var gyms = gym()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        // Do any additional setup after loading the view.
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(gyms.local, completionHandler: {
            placemarks, error in
            if let error = error{
                print(error)
                return
            }
            
            if let placemarks = placemarks{
                
                //get the first placemark
                let placemark = placemarks[0]
                
                //add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.gyms.name
                annotation.subtitle = self.gyms.type
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                }
                
                //display the annotation
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
            }
        })
        
    }
    
    func mapView(_ mapView: MKMapView,viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        //Reuse the annotation if possible
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView?.glyphText = "🦋"
        annotationView?.markerTintColor = UIColor.darkGray
        
        
        return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
