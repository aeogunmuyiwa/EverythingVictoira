//
//  EmergencyServicesViewController.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

//protocol CollectionViewControllerDataSource : class {
//    var availableLabels:  { get set }
//}

class EmergencyServicesViewController: UIViewController {

    lazy var backButton : UIBarButtonItem  = {
        let button = UIButton()
        button.addTarget(self, action: #selector(swipBackView), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let backButton = UIBarButtonItem(customView: button)

        return backButton
    }()

    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = true
        tableView.backgroundColor = CustomColors.appBackground
        tableView.backgroundView?.backgroundColor = CustomColors.appBackground
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
        view.backgroundColor = CustomColors.appBackground
        view.addSubview(tableView)
        tableView.pin(to: view)
        tableView.dataSource = tableViewObject
        tableView.delegate = tableViewObject
        tableView.reloadData()
        self.navigationItem.setLeftBarButton(backButton, animated: true)

        // Do any additional setup after loading the view.
    }


}
