//
//  ServiceListViewModel.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

struct ServiceListTableViewCell_datasouce {
    let image : String
    let cellDetail : String
    let navigationId : navigationViewControllers?
}

class ServiceListViewModel: NSObject  {

    private let cellId = "ServiceListTableViewCell"
   
    private let NavigationUtilManager : NavigationUtil?
    

    private let serviceList : [ServiceListTableViewCell_datasouce] = [
        ServiceListTableViewCell_datasouce(image: "Census", cellDetail: "Census", navigationId: .Census),
        ServiceListTableViewCell_datasouce(image: "Emergency Service", cellDetail: "Emergency Service",navigationId: .EmergencyService),
        ServiceListTableViewCell_datasouce(image: "Financial", cellDetail: "Financial",navigationId: .Financial),
        ServiceListTableViewCell_datasouce(image: "GIS Mapping", cellDetail: "GIS Mapping",navigationId: .GISMapping),
        ServiceListTableViewCell_datasouce(image: "Land", cellDetail: "Land",navigationId: .Land),
        ServiceListTableViewCell_datasouce(image: "Parks", cellDetail: "Parks",navigationId: .Parks),
        ServiceListTableViewCell_datasouce(image: "Permit & Licence", cellDetail: "Permit & Licence",navigationId: .PermitLicence),
        ServiceListTableViewCell_datasouce(image: "Planning and Development", cellDetail: "Planning and Development",navigationId: .PlanningandDevelopment),
        ServiceListTableViewCell_datasouce(image: "Transportation and Parking", cellDetail: "Transportation and Parking",navigationId: .TransportationandParking),
        ServiceListTableViewCell_datasouce(image: "Underground Utilities", cellDetail: "Underground Utilities",navigationId: .UndergroundUtilities),
    ]
    init(controller: UIViewController) {
        self.NavigationUtilManager = .init(controller: controller)
    }
   
    
    
}

extension ServiceListViewModel : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return serviceList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ServiceListCollectionViewCell 
        cell.customeInit(datasource: serviceList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: collectionView.frame.width - 50, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //navigate to the selected controller using the navigation id of Servicelist
        if  let cell = collectionView.cellForItem(at: indexPath){
            CustomAnimination.init().Fadeout(view: cell, completion: {
                if let navigationRaw = self.serviceList[indexPath.row].navigationId?.rawValue {
                    DispatchQueue.main.async {
                        self.NavigationUtilManager?.determineNavigation(navigationControllerIdentifier: navigationRaw, classType: nil, apiKey: nil)
                    }
                }
            })
        }
        
        

    }
    
    
}

