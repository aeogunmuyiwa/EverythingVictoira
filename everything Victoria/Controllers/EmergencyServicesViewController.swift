//
//  EmergencyServicesViewController.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class EmergencyServicesViewController: UIViewController {

    lazy var backButton : UIBarButtonItem  = {
        let button = UIButton()
        button.addTarget(self, action: #selector(swipBackView), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let backButton = UIBarButtonItem(customView: button)
//        backButton.target = EmergencyServicesViewController.self
//        backButton.action = #selector(swipBackView)
        return backButton
    }()
//    let btn1 = UIButton()
//    btn1.setImage(UIImage(named: "img1"), forState: .Normal)
//    btn1.frame = CGRectMake(0, 0, 30, 30)
//    btn1.addTarget(self, action: Selector("action1:"), forControlEvents: .TouchUpInside)
//    self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: btn1), animated: true);
    
    
    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = true
        tableView.backgroundColor = .white
        tableView.register(EmergencyServicesTableViewCell.self, forCellReuseIdentifier: "EmergencyServicesTableViewCell")
        return tableView
    }()
    
    
    lazy var tableViewObject:EmergencyServicesViewModel = {
        let tableViewObject = EmergencyServicesViewModel(controller: self)
        return tableViewObject
    }()
    
    @objc func swipBackView (){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.backgroundColor = CustomColors.appBackground
        tableView.pin(to: view)
        tableView.dataSource = tableViewObject
        tableView.delegate = tableViewObject
        tableView.reloadData()
        self.navigationItem.setLeftBarButton(backButton, animated: true)

        // Do any additional setup after loading the view.
    }


}
