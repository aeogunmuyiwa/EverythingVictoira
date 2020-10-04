//
//  criticalInfrastructureFacilities.swift
//  everything Victoria
//
//  Created by CanAssist  on 2020-09-18.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import CoreLocation

struct criticalInfrastructureFacilities: Decodable {
    let type : String?
    let name : String?
    let features : [features]?    
}



enum AnnotationType: String  {
    case Point = "Point"
    case Polygon = "Polygon"
}

struct mapStruct {
  let name: String
  let lattitude: CLLocationDegrees
  let longtitude: CLLocationDegrees
    let annotationType : AnnotationType
}

struct criticalInfrastructureFacilities_Manager {
    func criticalInfrastructureFacilities (datasource : Any , completion : @escaping(mapStruct) -> Void ){
        dump(datasource)
        if let datasouce_value  = datasource as? criticalInfrastructureFacilities {
           // dump(datasouce_value)
            let notificationObject : [String : String?] = ["title" : datasouce_value.name]
            NotificationCenter.default.post(name: .mapViewNavigation, object: nil, userInfo: notificationObject)
            guard let features = datasouce_value.features else { return  }
            for element in features.enumerated(){
                if let cordinate = element.element.geometry?.coordinates, let locationName = element.element.properties?.Location ,let geometryType = element.element.geometry?.type ,let lat = cordinate[1], let long = cordinate[0]{
                    if let GeometryType = AnnotationType.init(rawValue: geometryType){
                        let value = mapStruct(name: locationName, lattitude: CLLocationDegrees(lat), longtitude: CLLocationDegrees(long), annotationType: GeometryType)
                        completion(value)
                    }
                }
            }
        }
    }
}

struct features : Decodable {
    let type : String?
    let properties : properties?
    let geometry : geometry?
}

struct properties : Decodable {
    let OBJECTID_1 : Int?
    let Location : String?
    let Label : String?
    
    
}
struct geometry : Decodable {
    let type : String?
    let coordinates : [Float?]?
}



