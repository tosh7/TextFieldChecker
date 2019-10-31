//
//  UIColor+Extension.swift
//  TextFieldChecker
//
//  Created by Satoshi Komatsu on 2019/10/31.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

extension UIColor {
    
    //カラーコードをRGBへと変更させる
    convenience init(code: String) {
        var color: UInt32 = 0
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
        if Scanner(string: code.replacingOccurrences(of: "#", with: "")).scanHexInt32(&color) {
            r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            g = CGFloat((color & 0x00FF00) >>  8) / 255.0
            b = CGFloat( color & 0x0000FF       ) / 255.0
        }
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

extension UIColor {
    
    class saketify {
        public static var beerYellow = UIColor(code: "#e8c53b")
        public static var backGroundColor = UIColor(code: "#060e1e")
        public static var shadowGray = UIColor(code: "#cccccc")
    }
}
