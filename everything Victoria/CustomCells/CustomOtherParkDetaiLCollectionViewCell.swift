//
//  CustomOtherParkDetaiLCollectionViewCell.swift
//  everything Victoria
//
//  Created by CanAssist  on 2020-09-15.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class CustomOtherParkDetaiLCollectionViewCell: UICollectionViewCell {
    
 var data : CustomParkdetails?{
        didSet{
            setData()
        }
    }
    let parkView:UIView = {
          let v = UIView()
          v.translatesAutoresizingMaskIntoConstraints = false
      
        v.backgroundColor? = .random
          v.layer.cornerRadius = 30
          return v
      }()
    
   
    
    let parkNameLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: CustomFont.RalewayBold, size: 20)
        l.textColor = .black
        return l
    }()
    let cityNameLabel:UILabel = {
         let l = UILabel()
        l.text = "City of Victoria"
         l.translatesAutoresizingMaskIntoConstraints = false
         l.font = UIFont(name: CustomFont.RalewayBold, size: 15)
         l.textColor = .black
         return l
     }()
    
    let detailLabel:UILabel = {
           let l = UILabel()
          l.text = "details"
        l.numberOfLines = 0
        l.contentMode = .scaleToFill
           l.translatesAutoresizingMaskIntoConstraints = false
           l.font = UIFont(name: CustomFont.RalewayBold, size: 10)
           l.textColor = .black
           return l
       }()
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(parkView)
        parkView.addSubview(parkNameLabel)
        parkView.addSubview(cityNameLabel)
        parkView.addSubview(detailLabel)
        parkView.pin(to: self)
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            parkNameLabel.centerXAnchor.constraint(equalTo: parkView.centerXAnchor),
            parkNameLabel.centerYAnchor.constraint(equalTo: parkView.centerYAnchor, constant: -40),
            cityNameLabel.topAnchor.constraint(equalTo: parkNameLabel.bottomAnchor, constant: 0),
            cityNameLabel.centerXAnchor.constraint(equalTo: parkView.centerXAnchor),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 30),
            detailLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 0),
            detailLabel.leadingAnchor.constraint(equalTo: parkView.leadingAnchor, constant: 10),
            detailLabel.trailingAnchor.constraint(equalTo: parkView.trailingAnchor, constant: -5),
            detailLabel.bottomAnchor.constraint(equalTo: parkView.bottomAnchor)
        ])
       
    }
    
    //add king fisher image proccessor later
    func setData(){
        guard let data = data else{return}
      
        parkView.backgroundColor = CustomColors.appBlack
        parkNameLabel.text = data.name
        detailLabel.text = data.detail
    }
}

