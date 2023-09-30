//
//  ViewController.swift
//  GetLocation
//
//  Created by Drillmaps on 30/09/23.
//

import UIKit
import CoreLocation

/*
 1. In the Info.plist add a new row and select "Privacy Location Always and when in use and add a description
 2. In the View controller import Corelocation
 3. Create UI elements and create outlets
 4. Implement CLLocationManagerDelegate in the class
 5. Add an instance of location Manager (CLLocationManager)
 6. in the viewdidload add delegate to self and desired accuracy
 7. Add locationManager function of didUpdateLocations function
 8. Also add locationManager didFailWithError function
 9. If you want to get address write a function which uses CLGeocoder and get the reverse address
 10. If you want to update the location automatically then user Location manager's significantLocationChangeMonitoringAvailable function
 
 */

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var lblLatitude: UILabel!
    
    @IBOutlet weak var lblLongitude: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        startSignificantChangeLocation()
    }
    @IBAction func getLocationAction(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func startSignificantChangeLocation(){
        
        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude;
        let lng = location.coordinate.longitude;
        
        print("Latitude = \(lat)")
        print("Longitude = \(lng)")
        
        lblLatitude.text = "Latitude = \(lat)"
        lblLongitude.text = "Longitude = \(lng)"
        
        getLocationAddress(location: location)
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error in getting location = \(error.localizedDescription)")
    }
    
    func getLocationAddress(location : CLLocation){
        let clGeoCoder = CLGeocoder()
        
        clGeoCoder.reverseGeocodeLocation(location) { clPlaceMarks, error in
            if error != nil {
                print("Error in getting location from GeoCoder \(error?.localizedDescription)")
                return
            }
            
            guard let place = clPlaceMarks?.last else {return}
            var address = ""
            print(place.name)
            print(place.locality)
            print(place.postalCode)
            print(place.subAdministrativeArea)
            print(place.subLocality)

        }
        
        
    }

    
    

}

