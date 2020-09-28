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

enum viewType  {
    case CriticalInfrastructureFacilities
    case UtilityStructures
    

}


class MapData: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    init( title: String?, locationName: String?,coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    var subtitle: String? {
        return locationName
    }
}














class MapViewModel:  MKMapView {
    private let identifier = "MapViewModel"
    var currentLocation: MKUserLocation?
    private var locationManager:CLLocationManager!
    var datasource: Any?
    private var controller : UIViewController?
    var obectType : navigationViewControllers?
    private let rangeInMeters: Double = 500
    
    //  private var allAnnotations: [MKAnnotation]?
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        //determineCurrentLocation()
        
    }
    init(datasource : Any, objectType : navigationViewControllers, controller : UIViewController) {
        super.init(frame: .zero)
        registerMapAnnotationViews()
        determineCurrentLocation()
        self.datasource = datasource
        self.obectType = objectType
        self.controller = controller
        self.delegate = self
        switch obectType {
        
            case .CriticalInfrastructureFacilities:
                criticalInfrastructureFacilities_Manager.init().criticalInfrastructureFacilities(datasource: datasource, completion: {  result in
                    DispatchQueue.main.async {
                        self.MapViewModel_addAnnptation(annotationType: result.annotationType, mapStruct: result)
                    }
                })
                
            case .UtilityStructures :
                UtilityStructures_Manager.init().UtilityStructures_Manager(datasource: datasource, completion: {
                    result in
                    
                    DispatchQueue.main.async {
                        self.MapViewModel_addAnnptation(annotationType: result.annotationType, mapStruct: result)
                    }
                })
        case .TsunamiHazardLine:
            
            TsunamiHazardLineManager.init().TsunamiHazardLine(datasource: datasource, completion: { shape in
                let test = MKMultiPolygon([shape])
                self.addOverlay(test)
            })
            default:
                print("default")
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MapViewModel : MKMapViewDelegate ,CLLocationManagerDelegate {
    func MapViewModel_addAnnptation(annotationType : AnnotationType , mapStruct : mapStruct){
        let annotation = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: mapStruct.lattitude, longitude: mapStruct.longtitude))
        annotation.title  = mapStruct.name
        annotation.subtitle = mapStruct.name
        // Dispaly all annotations on the map.
        self.addAnnotation(annotation)
    }
    
    
    /// Register the annotation views with the `mapView` so the system can create and efficently reuse the annotation views.
    /// - Tag: RegisterAnnotationViews
    private func registerMapAnnotationViews() {
        self.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(CustomAnnotation.self))
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        currentLocation = userLocation
    }
    /// The map view asks `mapView(_:viewFor:)` for an appropiate annotation view for a specific annotation.
    /// - Tag: CreateAnnotationViews
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: CustomAnnotationView.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        var annotationView: MKAnnotationView?
        
        if let annotation = annotation as? CustomAnnotation {
            annotationView = setupCustomAnnotationView(for: annotation, on: mapView)
        }
        return annotationView
    }
    
    private func setupCustomAnnotationView(for annotation: CustomAnnotation, on mapView: MKMapView) -> MKAnnotationView {
        let reuseIdentifier = NSStringFromClass(CustomAnnotation.self)
        let flagAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier, for: annotation)
        // Provide the annotation view's image.
        let image = #imageLiteral(resourceName: "flag")
        flagAnnotationView.image = image
        flagAnnotationView.canShowCallout = true
        // Provide the left image icon for the annotation.
        flagAnnotationView.leftCalloutAccessoryView = UIImageView(image: #imageLiteral(resourceName: "flag"))
        // Offset the flag annotation so that the flag pole rests on the map coordinate.
        let offset = CGPoint(x: image.size.width / 2, y: -(image.size.height / 2) )
        flagAnnotationView.centerOffset = offset
        
        let rightButton = UIButton(type: .detailDisclosure)
        flagAnnotationView.rightCalloutAccessoryView = rightButton
        return flagAnnotationView
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let details = view.annotation as? CustomAnnotation else { return }
        let placeName = details.title
        let placeInfo = details.subtitle
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        controller?.present(ac, animated: true)
    }
    
    
    // Providing a multipolygon rendererfunc
   func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let multiPolygon = overlay as? MKMultiPolygon {
            let renderer = MKMultiPolygonRenderer(multiPolygon: multiPolygon)
            renderer.fillColor = .quaternarySystemFill
            renderer.strokeColor = UIColor.init(hexString: "#F71843")
            renderer.lineWidth = 5.0
            return renderer
            
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    
    
    
    
    
    
    
    
    
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        self.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            guard let userLocation = locationManager.location?.coordinate else{return}
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 5000, longitudinalMeters: 500)
            self.setRegion(viewRegion, animated: true)
        }else{
            //  Todo : show alert
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status {
        
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager?.startUpdatingLocation()
            self.showsUserLocation = true
     
            
        case .denied, .restricted:
            locationManager?.startUpdatingLocation()
            self.showsUserLocation = false
            currentLocation = nil
            
        default:
            print("need location")
            currentLocation = nil
        //todo show alert
        }
    }
    
    
    
}
