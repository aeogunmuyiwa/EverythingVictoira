//
//  MapViewModel.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa
import CoreLocation

enum dataType: String  {
    case Point = "Point"
}
enum viewType  {
    case CriticalInfrastructureFacilities
    case UtilityStructures
}


class MapData: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let dataType: dataType?
  let coordinate: CLLocationCoordinate2D

  init( title: String?, locationName: String?, dataType: dataType?,coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.locationName = locationName
    self.dataType = dataType
    self.coordinate = coordinate
    super.init()
  }
  var subtitle: String? {
    return locationName
  }
}

class MapViewModel:  MKMapView {
    var locationManager:CLLocationManager!
    var datasource: Any?
    var obectType : navigationViewControllers?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        determineCurrentLocation()
   
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func receivedDataSource(_ notification: NSNotification){
        if let result = notification.userInfo as NSDictionary? {
            dump(result)
        }
    }
}


extension MapViewModel : MKMapViewDelegate ,CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {    let mUserLocation:CLLocation = locations[0] as CLLocation
        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.setRegion(mRegion, animated: true)

        // Get user's Current Location and Drop a pin
        let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate = CLLocationCoordinate2DMake(mUserLocation.coordinate.latitude, mUserLocation.coordinate.longitude)
        self.addAnnotation(mkAnnotation)}
    
    
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        self.showsUserLocation = true

        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }else{
            //  Todo : show alert
            
        }
    }
    
}
