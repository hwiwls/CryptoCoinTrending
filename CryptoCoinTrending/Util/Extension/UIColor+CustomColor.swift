//
//  UIColor+CustomColor.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import UIKit

extension UIColor {
    static let customColor = CustomColors()
    
    struct CustomColors {
        let pointBlueColor = UIColor(named: "PointBlueColor") ?? .white
        let pointDarkGrayColor = UIColor(named: "PointDarkGrayColor") ?? .white
        let pointGrayColor = UIColor(named: "PointGrayColor") ?? .white
        let pointLightGrayColor = UIColor(named: "PointLightGrayColor") ?? .white
        let pointLightPinkColor = UIColor(named: "PointLightPinkColor") ?? .white
        let pointLightSkyBlueColor = UIColor(named: "PointLightSkyBlueColor") ?? .white
        let pointPurpleColor = UIColor(named: "PointPurpleColor") ?? .white
        let pointReactiveRedColor = UIColor(named: "PointReactiveRedColor") ?? .white
    }
}
