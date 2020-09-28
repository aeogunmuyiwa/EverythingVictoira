//
//  CustomparkDetaiLCollectionViewCell.swift
//  everything Victoria
//
//  Created by CanAssist  on 2020-09-15.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class CustomparkDetaiLCollectionViewCell: UICollectionViewCell {
    var data : CustomPark?{
        didSet{
            setData()
        }
    }
    let parkView:UIView = {
          let v = UIView()
          v.translatesAutoresizingMaskIntoConstraints = false
          v.backgroundColor = .red
          v.layer.cornerRadius = 30
          return v
      }()
    
    let locateView:UIView = {
         let v = UIView()
         v.translatesAutoresizingMaskIntoConstraints = false
         v.layer.cornerRadius = 20
         v.backgroundColor = .white
         return v
     }()
    
    let parkNameLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: CustomFont.RalewayBold, size: 15)
        l.textColor = .black
        return l
    }()
    let LocationImage:UIImageView = {
           let img = UIImageView()
           img.translatesAutoresizingMaskIntoConstraints = false
           img.layer.cornerRadius = 10
           img.image = UIImage(named: "location")
           img.contentMode = .scaleAspectFill
           img.clipsToBounds = true
           return img
       }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(parkView)
        parkView.addSubview(parkNameLabel)
        parkView.addSubview(locateView)
        locateView.addSubview(LocationImage)
        parkView.pin(to: self)
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            locateView.topAnchor.constraint(equalTo: parkView.topAnchor, constant: 30),
            locateView.widthAnchor.constraint(equalToConstant: 160),
            locateView.heightAnchor.constraint(equalToConstant: 70),
            locateView.centerXAnchor.constraint(equalTo: parkView.centerXAnchor),

            LocationImage.leadingAnchor.constraint(equalTo: locateView.leadingAnchor, constant: 15),
            LocationImage.heightAnchor.constraint(equalToConstant: 40),
            LocationImage.widthAnchor.constraint(equalToConstant: 40),
            LocationImage.centerYAnchor.constraint(equalTo: locateView.centerYAnchor),
            
            parkNameLabel.leadingAnchor.constraint(equalTo: parkView.leadingAnchor, constant: 20),
            parkNameLabel.bottomAnchor.constraint(equalTo: parkView.bottomAnchor, constant: -30)
        ])
       
    }
    
    //add king fisher image proccessor later
    func setData(){
        guard let data = data else{return}
        parkView.backgroundColor = CustomColors.appGreen
        parkNameLabel.text = data.name
    }
}
