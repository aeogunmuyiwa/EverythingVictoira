//
//  ServiceListTableViewCell.swift
//  everything Victoria
//
//  Created by Adebayo  Ogunmuyiwa on 2020-09-26.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ServiceListCollectionViewCell : UICollectionViewCell {
    private let disposeBag = DisposeBag()
    
//    var datasource : ServiceListTableViewCell_datasouce?
    
    private var cellImage:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var cellDetail: UILabel = {
        let cellDetail = UILabel()
        cellDetail.translatesAutoresizingMaskIntoConstraints = false
        cellDetail.numberOfLines = 2
        cellDetail.font = UIFont(name: CustomFont.RalewayBold, size: 15)
        cellDetail.textColor = .black
        return cellDetail
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
   
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func customeInit(datasource  : ServiceListTableViewCell_datasouce){
            awakeFromNib()
                DispatchQueue.main.async {
                    if let image = UIImage(named: datasource.image){
                        self.cellImage.image = image
                    }
                    self.cellDetail.text = datasource.cellDetail
                }
               
            
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
        
        // Initialization code
    }
    private  func setupConstraints(){
        addSubview(cellImage)
        addSubview(cellDetail)
        contentView.layer.cornerRadius = 25
        contentView.backgroundColor = .white
        NSLayoutConstraint.activate([
            cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            cellImage.heightAnchor.constraint(equalToConstant: contentView.frame.height / 2),
            cellImage.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            
            cellDetail.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            cellDetail.leftAnchor.constraint(equalTo: cellImage.rightAnchor, constant: 5),
            cellDetail.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            cellDetail.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
}
