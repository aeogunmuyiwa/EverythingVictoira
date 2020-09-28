//
//  ViewController.swift
//  everything Victoria
//
//  Created by CanAssist  on 2020-09-15.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: false)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = CustomColors.appBackground
        cv.register(parkDetaiLCollectionViewCell.self, forCellWithReuseIdentifier: "parkDetaiLCollectionViewCell")
        cv.register(OtherParkDetailCollectionViewCell.self, forCellWithReuseIdentifier: "OtherParkDetailCollectionViewCell")
        cv.delegate = self
        cv.dataSource = self
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = CustomColors.appBackground
        view.addSubview(collectionView)
      //  apiManager.init().makeRequest()
        collectionView.pin(to: view)
      
        
        // Do any additional setup after loading the view.
    }


}
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "parkDetaiLCollectionViewCell", for: indexPath) as! parkDetaiLCollectionViewCell
            return cell
        }
        if indexPath.row == 1  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherParkDetailCollectionViewCell", for: indexPath) as! OtherParkDetailCollectionViewCell
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: collectionView.frame.width, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
    
}

