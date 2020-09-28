//
//  AlertModel.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class AlertModel: NSObject {
    enum AlertType {
        case confirmation
        case error
        
    }
    func presentAlert(contoller : UIViewController?, message : String, title : String, alertType :  AlertType){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        switch alertType {
            case .confirmation:
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            case.error :
                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            
        }

      

        if let Maincontroller = contoller {
            Maincontroller.present(alert, animated: true)
        }
        
    }
}
