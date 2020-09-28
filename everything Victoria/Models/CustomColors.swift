//
//  CustomColors.swift
//  everything Victoria
//
//  Created by CanAssist  on 2020-09-15.
//  Copyright © 2020 adebayo. All rights reserved.
//

import UIKit

struct CustomColors {
    static func random<G: RandomNumberGenerator>(using generator: inout G) -> UIColor {
        return arrayColors.randomElement(using: &generator)!
       }
    //#549672
    static let appGreen : UIColor = UIColor(red: 84/255, green: 150/255, blue: 114/255, alpha: 1)
    static let appBlack:UIColor = UIColor(red: 47/255, green: 44/255, blue: 80/255, alpha: 1)
    static let appBackground:UIColor = .white
    
    static let arrayColors : [UIColor] = [
        UIColor(red: 84/255, green: 150/255, blue: 114/255, alpha: 1),
        UIColor(red: 148/255, green: 204/255, blue: 173/255, alpha: 1),
        UIColor(red: 34/255, green: 102/255, blue: 66/255, alpha: 1),
      //  UIColor(red: 47/255, green: 44/255, blue: 80/255, alpha: 1)
        
    ]
    static func random() -> UIColor {
        var g = SystemRandomNumberGenerator()
        
        if let randomcolor = arrayColors.randomElement(using: &g) {
            return randomcolor
        }
        return random()
    }
}
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}


struct CustomFont {
    static let RalewayBold = "Raleway-Bold"
    static let RalewayMediumItalic = "Raleway-MediumItalic"
    static let RalewaySemiBoldItalic = "Raleway-SemiBoldItalic"
    static let PoppinsRegular = "Poppins-Regular"
    static let PoppinsMedium = "Poppins-Medium"
}
