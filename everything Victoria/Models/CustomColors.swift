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
    static let appGreen : UIColor = UIColor.init(hexString: "#A5D0C4")
    static let appSecondayGreen : UIColor = UIColor.init(hexString: "#549672")
   // static let
   /* #1fb1ae
    #28717b
    #7ec3b0
    #7cd4e7*/
    
    static let appBackground:UIColor = UIColor.init(hexString: "#1F2634")

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
    
        convenience init(hexString: String) {
            let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int = UInt64()
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        }
    
}



struct CustomFont {
    static let RalewayBold = "Raleway-Bold"
    static let RalewayMediumItalic = "Raleway-MediumItalic"
    static let RalewaySemiBoldItalic = "Raleway-SemiBoldItalic"
    static let PoppinsRegular = "Poppins-Regular"
    static let PoppinsMedium = "Poppins-Medium"
}
