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

//    lazy var mapView : MapViewModel = {
//
//
//        let mapView =  MapViewModel()
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        return mapView
//
//
//
//    }()
    
    let mapView =  MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstriants()
        // Do any additional setup after loading the view.
    }
    

    func setUpConstriants(){
        view.addSubview(mapView)
        mapView.pin(to: view)
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
