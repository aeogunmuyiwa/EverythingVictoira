//
//  ServiceListViewTableViewCell.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

class EmergencyServicesTableViewCell: UITableViewCell {

   private lazy var serviceName : UILabel = {
        let serviceName = UILabel()
        serviceName.translatesAutoresizingMaskIntoConstraints = false
        serviceName.font = UIFont(name: CustomFont.RalewayBold, size: 20)
        serviceName.textColor = .black
        return serviceName
        
    }()
    private lazy var serviceLocation : UILabel = {
        let serviceLocation = UILabel()
        serviceLocation.translatesAutoresizingMaskIntoConstraints = false
        serviceLocation.font = UIFont(name: CustomFont.RalewaySemiBoldItalic, size: 10)
        serviceLocation.textColor = .black
        return serviceLocation
        
    }()
    private lazy var serviceDescription : UILabel = {
        let serviceDescription = UILabel()
        serviceDescription.translatesAutoresizingMaskIntoConstraints = false
        serviceDescription.font = UIFont(name: CustomFont.RalewaySemiBoldItalic, size: 15)
        serviceDescription.numberOfLines = 8
        serviceDescription.textColor = .black
        return serviceDescription
        
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpConstraints()
        // Initialization code
    }
    func customInit(dataSource : EmergencyServicesdatasouce){
        awakeFromNib()
        DispatchQueue.main.async {
            self.serviceName.text = dataSource.ServiceName
            self.serviceLocation.text = dataSource.locationName
            self.serviceDescription.text = dataSource.description
        }
    }
    func setUpConstraints(){
        contentView.addSubview(serviceName)
        contentView.addSubview(serviceLocation)
        contentView.addSubview(serviceDescription)
        //caddSubview(serviceName)
        NSLayoutConstraint.activate([
            serviceName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            serviceName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            serviceName.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -10),
            serviceName.heightAnchor.constraint(equalToConstant: 30),
            
            serviceLocation.topAnchor.constraint(equalTo: serviceName.bottomAnchor, constant: 0),
            serviceLocation.leftAnchor.constraint(equalTo: serviceName.leftAnchor, constant: 0),
            serviceLocation.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 10),
            serviceLocation.heightAnchor.constraint(equalToConstant: 20),
            
            serviceDescription.topAnchor.constraint(equalTo: serviceLocation.bottomAnchor, constant: 0),
            serviceDescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            serviceDescription.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            //serviceDescription.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -10),
            serviceDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
