//
//  CustomAnimination.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-28.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class CustomAnimination {
    func Fadeout(view : UIView , completion :@escaping() -> Void){
        UIView.animate(withDuration: 0.5, animations: {
            view.alpha = 0.5
        }, completion: {result in
            UIView.animate(withDuration: 0.5, animations: {
                view.alpha = 1
                completion()
            })
        })
    }
}
