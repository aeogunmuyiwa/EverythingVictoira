//
//  MapViewController.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    
    weak var mapView : MapViewModel? = {
        let mapView =  MapViewModel()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    //back view properties like back buttons
    private lazy var BasicViewProperties : BasicViewModel = {
        let BasicViewProperties = BasicViewModel(self)
        return BasicViewProperties
    }()
    //var mapView : MapViewModel?
    var datasource : Any?
    var obectType : navigationViewControllers?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstriants()
        BasicViewProperties = BasicViewModel.init(self)
        // Do any additional setup after loading the view.
    }
    

    func setUpConstriants(){
        //set navbar back button 
        
        DispatchQueue.main.async { [unowned self] in
            if let datasource = self.datasource , let obectType = self.obectType{
                NotificationCenter.default.addObserver(self, selector: #selector(datasourceUIchanges(notification:)), name: .mapViewNavigation, object: nil)
                self.mapView = .init(datasource: datasource, objectType: obectType, controller: self)
                if let mapView = mapView{
                    self.view.addSubview(mapView)
                    mapView.pin(to: self.view)
                }
                                
            }

        }
    }
   
    @objc private func datasourceUIchanges(notification: NSNotification){
        //update the nav bar titile with datasource name 
        if let info = notification.userInfo , let title = info["title"] as? String {
            self.navigationItem.title = title
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
