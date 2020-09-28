//
//  NavigationUtil.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class NavigationUtil {
    private let disposeBag = DisposeBag()
    private weak var MainController : UIViewController?
   
    init(controller : UIViewController) {
        self.MainController = controller
    }
    /*Looks at the controller identifier, checks if the controller exists in the storyboard and performs the navigation if the controller exist*/
    func determineNavigation( navigationControllerIdentifier : String,classType : navigationViewControllers?,apiKey : String?){
        switch classType {
        case .CriticalInfrastructureFacilities:
            if let apiKey = apiKey {
                apiManager.init().dataRequest(with: apiKey, objectType: criticalInfrastructureFacilities.self, completion: { result in
                    switch result{
                        case.failure(let error):
                            AlertModel.init().presentAlert(contoller: self.MainController, message: error.localizedDescription, title: "Error" , alertType: .error)
                        case .success(let object) :
                            self.mapViewNavigation(withIdentifier: navigationControllerIdentifier, objectType: .CriticalInfrastructureFacilities, result: object)
                    }
                })
            }
        case .UtilityStructures:
            print("")
        case .TsunamiHazardLine:
            print("")
        case .FireDispatchAreas:
            print("")
        default:
            performNavigation(navigationControllerIdentifier: navigationControllerIdentifier)
        }
    }
     
  
    func mapViewNavigation(withIdentifier : String , objectType : navigationViewControllers , result : Any ){
        let datasource : [navigationViewControllers : Any] = [objectType : result]
        NotificationCenter.default.post(name: .mapViewNavigation, object: nil, userInfo: datasource)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateVC(withIdentifier: withIdentifier)  as? MapViewController
        DispatchQueue.main.async {
            if let viewController = vc  {
               
                viewController.mapView.datasource = result
                viewController.mapView.obectType = objectType
                viewController.modalPresentationStyle = .fullScreen
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.modalPresentationStyle = .fullScreen
                self.MainController?.navigationController?.show(navigationController, sender: self)
            }

        }
    }
    
    //normal navigation with identiferi
    func  performNavigation( navigationControllerIdentifier : String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateVC(withIdentifier: navigationControllerIdentifier)
        
        if let viewController = vc {
            viewController.modalPresentationStyle = .fullScreen
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .fullScreen
            MainController?.navigationController?.show(navigationController, sender: self)
//            if let MainController = MainController {
//                navigationController.modalPresentationStyle = .fullScreen
//                MainController.present(navigationController, animated: true, completion: nil)
//
//            }
        }
    }
    
    
}

extension UIStoryboard {
    /* check if an identifier exist in the storyboard*/
    func instantiateVC(withIdentifier identifier: String) -> UIViewController? {
        // "identifierToNibNameMap" – dont change it. It is a key for searching IDs
        if let identifiersList = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
            if identifiersList[identifier] != nil {
                return self.instantiateViewController(withIdentifier: identifier)
            }
        }
        return nil
    }
}

enum navigationViewControllers : String {
    
    case Census =  "CensusViewController"
    case EmergencyService =  "EmergencyServicesViewController"
    case Financial =  "FinancialViewController"
    case GISMapping =  "GISMappingViewController"
    case Land =   " ViewController"
    case Parks =  "ParkssViewController"
    case PermitLicence =  "PermitLicenceViewController"
    case PlanningandDevelopment =  "PlanningandDevelopmentViewController"
    case TransportationandParking =  "TransportationandParkingViewController"
    case UndergroundUtilities =  "UndergroundUtilitiesViewController"
    case mapView = "MapViewController"
    case CriticalInfrastructureFacilities = "CriticalInfrastructureFacilities"
    case UtilityStructures = "UtilityStructures"
    case TsunamiHazardLine = "TsunamiHazardLine"
    case FireDispatchAreas = "FireDispatchAreas"
}
