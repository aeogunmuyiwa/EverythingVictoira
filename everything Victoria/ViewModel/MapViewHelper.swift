//
//  MapViewHelper.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-28.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import MapKit
class MapViewHelper {
    weak var model : MKMapView? = .init()
    init(model : MKMapView,datasource : Any,obectType: navigationViewControllers) {
        self.model = model
        determineMapViewController(datasource: datasource, obectType: obectType)
    }
  private func MapViewModel_addAnnptation(annotationType : AnnotationType , mapStruct : mapStruct){
        let annotation = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: mapStruct.lattitude, longitude: mapStruct.longtitude))
        annotation.title  = mapStruct.name
        annotation.subtitle = mapStruct.name
        // Dispaly all annotations on the map.
        if let model = model {
            model.addAnnotation(annotation)
        }
       
    }
    private func determineMapViewController(datasource : Any, obectType : navigationViewControllers){
        
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
                if let model = model {
                    model.addOverlay(test)
                }
                
            })
        case .FireDispatchAreas :
            if let datasouce_value  = datasource as? FireDispatchAreas, let feature = datasouce_value.features {
                for item in feature.enumerated() {
                    if let name = item.element.properties?.Name, let lat = item.element.geometry?.coordinates.first?.first{
                        MapViewModel_addAnnptation(annotationType: .Point, mapStruct: .init(name: name, lattitude: lat[1], longtitude: lat[0], annotationType: .Point))
                    }
                }
               // print("features count : ", feature.count)
            }
            FireDispatchAreas_Manager.init().FireDispatchAreas(datasource: datasource, completion: { shape in
                let test = MKMultiPolygon([shape])
                if let model = model{
                    model.addOverlay(test)
                }
               
            })
            
        default:
            print("default")
        }
    }
}
