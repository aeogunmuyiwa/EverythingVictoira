//
//  EmergencyServicesViewModel.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

struct EmergencyServicesdatasouce {
    let ServiceName : String
    let locationName : String
    let description : String
    let apiKey : String?
    let navigationId : navigationViewControllers?
    let classKey : navigationViewControllers?
    
}

class EmergencyServicesData{
   private let locationName  = "City of Victoria"
    lazy var datasource : [EmergencyServicesdatasouce] =  {
        var datasource = [EmergencyServicesdatasouce]()
        datasource.append(EmergencyServicesdatasouce(ServiceName: "Critical Infrastructure Facilities (OCP)", locationName: locationName, description: "Critical Infrastructure Facilities include features such as: Coast Guard, Ferry, Fire Halls, Police Station, Heliports, Hospital, Seaports, Water Airports, and Government Buildings.", apiKey: "https://opendata.arcgis.com/datasets/5d287a2955f44efe8567f9ef950f2dbc_1.geojson", navigationId: .mapView, classKey: .CriticalInfrastructureFacilities))
        
        datasource.append(EmergencyServicesdatasouce(ServiceName: "Utility Structures (OCP)", locationName: locationName, description: "The Utility Structures layer is part of the City of Victoria's Official Community Plan (OCP), which provides a long-term vision for how the community will grow and change over the next 30 years. OCP layers are maintained by our Community Planning department.", apiKey: "https://opendata.arcgis.com/datasets/07a7b3ffd26d4960b907c4e56db018fb_3.geojson", navigationId: .mapView, classKey: .UtilityStructures))
        
        datasource.append(EmergencyServicesdatasouce(ServiceName: "Tsunami Hazard Line (2013 model)", locationName: locationName, description: "The Tsunami Hazard line is based on the maximum water elevation plus earthquake induced subsidence from mean sea level from the January 2013 Report Modeling of Potential Tsunami Inundation limits and Run-up for the Coastline of the Capital Regional District.", apiKey: "https://opendata.arcgis.com/datasets/53baaed8f16c4d13a5b98caaa27999fa_6.geojson", navigationId: .mapView, classKey: .TsunamiHazardLine))
        datasource.append(EmergencyServicesdatasouce(ServiceName: "Fire Dispatch Areas", locationName: locationName, description: "Fire Dispatch Areas are based on drive time analysis.  Fire trucks are dispatched from the City of Victoria's three fire halls in order, based on the expected drive time to reach a destination point.  The run order dispatches trucks starting from the shortest to longest expected drive time. Drive time analysis was conducted by GIS Analysts at FDM Software, for the purpose of implementing Computer Aided Dispatch with FDM Software.", apiKey: "https://opendata.arcgis.com/datasets/d338e12eaa3042dd8e454690ced08ca6_7.geojson", navigationId: .mapView, classKey: .FireDispatchAreas))
        return datasource
    }()
}


class EmergencyServicesViewModel: NSObject {
    private let cellId = "EmergencyServicesTableViewCell"
    private let NavigationUtilManager : NavigationUtil?
    private  let datasource = EmergencyServicesData.init()
    
    init(controller: UIViewController) {
        self.NavigationUtilManager = .init(controller: controller)
    }
    
    
}
extension EmergencyServicesViewModel : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return datasource.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EmergencyServicesTableViewCell
        cell.customInit(dataSource: datasource.datasource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigationRaw = datasource.datasource[indexPath.row].navigationId?.rawValue, let classType = datasource.datasource[indexPath.row].classKey {
           
            DispatchQueue.main.async {
                self.NavigationUtilManager?.determineNavigation(navigationControllerIdentifier: navigationRaw, classType: classType, apiKey: self.datasource.datasource[indexPath.row].apiKey)
            }
        }
    }
    
    
    
    
}
