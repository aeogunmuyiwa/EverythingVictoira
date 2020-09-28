//
//  OtherParkDetailCollectionViewCell.swift
//  everything Victoria
//
//  Created by CanAssist  on 2020-09-15.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class OtherParkDetailCollectionViewCell: UICollectionViewCell {
    
  
    let data: [CustomParkdetails] = [
        CustomParkdetails(name: "Hard Surface (Area)", cityName: "City of Victoria", detail: "Provide a stable surface for various parks infrastructure. Larger areas than Hard Surface (Point) data.  Polygons are hand drawn to approximate the area covered."),
        CustomParkdetails(name: "Parks and Open Space", cityName: "City of Victoria", detail: "Includes spaces like parks, parkettes, beaches, cemeteries, greens, squares, paths, playlots, and docks."),
        CustomParkdetails(name: "Hard Surface (Point)", cityName: "City of Victoria", detail: "Concrete pads, various sizes, used for picnic tables, benches and garbage cans. They remove the need for grass cutting under the fixture, provide a clean base for the users and provide a means to anchor the fixture."),
        CustomParkdetails(name: "Boulevard Turf", cityName: "City of Victoria", detail: "The City of Victoria has approximately 300 kilometres of boulevards within its boundaries. Most of these boulevards are maintained by property owners who own the land adjacent to the boulevard. Currently, the City offers a maintenance service to mow and edge boulevard grass. ")
    ]
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: false)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        cv.backgroundColor = CustomColors.appBackground
        cv.delegate = self
        cv.dataSource = self
       cv.register(CustomOtherParkDetaiLCollectionViewCell.self, forCellWithReuseIdentifier: "CustomOtherParkDetaiLCollectionViewCell")
        return cv
    }()
    
    
     override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(collectionView)
            collectionView.pin(to: self)
         
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}

extension OtherParkDetailCollectionViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomOtherParkDetaiLCollectionViewCell", for: indexPath) as! CustomOtherParkDetaiLCollectionViewCell
        cell.data = data[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, +50, 0, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }, completion: nil)
        
    }
 
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 100, height: 310)
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 25
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 30
       }
       
       
    
    
}



