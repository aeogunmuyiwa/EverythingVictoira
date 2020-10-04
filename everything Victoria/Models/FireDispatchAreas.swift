//
//  FireDispatchAreas.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-28.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class FireDispatchAreas: Decodable {
    let type : String?
    let name : String?
    let features : [features]?
    struct features : Decodable {
        let type : String?
        let properties : properties?
        let geometry : geometry?
    }
    struct properties : Decodable {
        let OBJECTID : Int?
        let SHAPE_Length : Float?
        let SHAPE_Area : Float?
        let Name : String?
        let RunOrder : String?
        let FDMID : Int?
    }
    struct geometry : Decodable {
        let type : String?
        let coordinates : [[[Double]]]
    }
}

struct FireDispatchAreas_Manager {
    func FireDispatchAreas(datasource : Any, completion : (MKPolygon) -> Void){
        if let datasouce_value  = datasource as? FireDispatchAreas {
            let notificationObject : [String : String?] = ["title" : datasouce_value.name]
            NotificationCenter.default.post(name: .mapViewNavigation, object: nil, userInfo: notificationObject)
            if let features = datasouce_value.features {
                for element in features.enumerated() {
                    if let geometry = element.element.geometry?.coordinates {
                        for item in geometry.enumerated(){
                            var shape : [CLLocationCoordinate2D] = .init()
                            for x in item.element.enumerated() {
                                shape.append(CLLocationCoordinate2D(latitude: x.element[1], longitude: x.element[0]))
                            }
                            let stage = MKPolygon(coordinates: shape, count: shape.count)
                            completion(stage)
                        }
                    }
                    
                }
            }
           
        }
    }
}
