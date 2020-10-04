//
//  BasicViewModel.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-03.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class BasicViewModel: NSObject {
   private lazy var backButton : UIBarButtonItem  = {
        let button = UIButton()
        button.addTarget(self, action: #selector(swipBackView), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let backButton = UIBarButtonItem(customView: button)
        return backButton
    }()
    
    private weak var controller : UIViewController?
    init(_ viewContoller : UIViewController) {
     
        controller = viewContoller
        super.init()
        setupButtons()
    }
    private func setupButtons(){
        controller?.navigationItem.setLeftBarButton(backButton, animated: true)
    }
    //dismiss vc
     @objc private func swipBackView (){
        controller?.dismiss(animated: true, completion: nil)
    }
}

