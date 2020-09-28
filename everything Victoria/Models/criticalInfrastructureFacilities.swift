//
//  criticalInfrastructureFacilities.swift
//  everything Victoria
//
//  Created by CanAssist  on 2020-09-18.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

struct criticalInfrastructureFacilities: Decodable {
    let type : String?
    let name : String?
    let features : [features]?    
}

//struct criticalInfrastructureFacilities_Manager {
//    let criticalInfrastructureApikey = "https://opendata.arcgis.com/datasets/5d287a2955f44efe8567f9ef950f2dbc_1.geojson"
//    func fetchData (closure : @escaping (Result<criticalInfrastructureFacilities>) -> Void){
//        apiManager.init().dataRequest(with: criticalInfrastructureApikey, objectType: criticalInfrastructureFacilities.self, completion: {result in
//            switch result {
//                  case .success(let object):
//                    closure(.success(object))
//                  case .failure(let error):
//                    closure(.failure( APPError.jsonParsingError(error)))
//            }
//        })
//    }
//}





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



