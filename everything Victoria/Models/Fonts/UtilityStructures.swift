//
//  UtilityStructures.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-28.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import CoreLocation

struct UtilityStructures : Decodable {
    let type : String?
    let name : String?
    let features : [features]?
    struct features : Decodable {
        let type : String?
        let properties : properties?
        let geometry : geometry?
    }
    struct properties : Decodable {
        let OBJECTID_1 : Int?
        let Anchor : String?

    }
}

struct UtilityStructures_Manager {
    
    func UtilityStructures_Manager (datasource : Any , completion : @escaping(mapStruct) -> Void ){
        if let datasouce_value  = datasource as? UtilityStructures {
            let notificationObject : [String : String?] = ["title" : datasouce_value.name]
            NotificationCenter.default.post(name: .mapViewNavigation, object: nil, userInfo: notificationObject)
            guard let features = datasouce_value.features else { return  }
            for element in features.enumerated(){
                if let cordinate = element.element.geometry?.coordinates, let locationName = element.element.properties?.Anchor ,let geometryType = element.element.geometry?.type ,let lat = cordinate[1], let long = cordinate[0]{
                    if let GeometryType = AnnotationType.init(rawValue: geometryType){
                        let value = mapStruct(name: locationName, lattitude: CLLocationDegrees(lat), longtitude: CLLocationDegrees(long), annotationType: GeometryType)
                        completion(value)
                    }
                }
            }
        }
    }
}
