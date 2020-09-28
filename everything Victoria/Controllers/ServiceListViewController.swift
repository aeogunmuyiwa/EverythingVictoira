//
//  ServiceListViewController.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-25.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class ServiceListViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 40, bottom: 30, right: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ServiceListCollectionViewCell .self, forCellWithReuseIdentifier: "ServiceListTableViewCell")
        return collectionView
        
    }()
    lazy var collectionViewObject:ServiceListViewModel = {
        let collectionView = ServiceListViewModel(controller: self)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = CustomColors.appBackground
        collectionView.dataSource = collectionViewObject
        collectionView.delegate = collectionViewObject
        collectionView.reloadData()
      

    }
    
  
    func setupView(){
        view.addSubview(collectionView)
        collectionView.pin(to: view)
    }
}

