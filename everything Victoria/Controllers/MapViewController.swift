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
    lazy var backButton : UIBarButtonItem  = {
        let button = UIButton()
        button.addTarget(self, action: #selector(swipBackView), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let backButton = UIBarButtonItem(customView: button)
        return backButton
    }()
     lazy var mapView : MapViewModel = {
        let mapView =  MapViewModel()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    //var mapView : MapViewModel?
    var datasource : Any?
    var obectType : navigationViewControllers?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstriants()
        // Do any additional setup after loading the view.
    }
    

    func setUpConstriants(){
        //set navbar back button 
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        DispatchQueue.main.async { [self] in
            if let datasource = self.datasource , let obectType = self.obectType{
                NotificationCenter.default.addObserver(self, selector: #selector(datasourceUIchanges(notification:)), name: .mapViewNavigation, object: nil)
                self.mapView = .init(datasource: datasource, objectType: obectType, controller: self)
                self.view.addSubview(self.mapView)
                self.mapView.pin(to: self.view)
                
            }

        }
    }
    //dismiss vc
    @objc func swipBackView (){
        self.dismiss(animated: true, completion: nil)
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
