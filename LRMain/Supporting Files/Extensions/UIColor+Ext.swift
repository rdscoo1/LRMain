//
//  UIColor+Ext.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
        // Check for hash and remove the hash
        let cleanedHexString = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex

        // String -> UInt64
        var rgbValue = UInt64()
        Scanner(string: cleanedHexString).scanHexInt64(&rgbValue)

        // UInt32 -> R,G,B
        let a, r, g, b: UInt64

        switch cleanedHexString.count {
        case 3: // RGB (12-bit)
            (r, g, b) = (
                (rgbValue >> 8) * 17,
                (rgbValue >> 4 & 0xF) * 17,
                (rgbValue & 0xF) * 17
            )

            self.init(
                red: CGFloat(r) / 255,
                green: CGFloat(g) / 255,
                blue: CGFloat(b) / 255,
                alpha: alpha
            )
        case 6: // RGB (24-bit)
            (r, g, b) = (
                rgbValue >> 16,
                rgbValue >> 8 & 0xFF,
                rgbValue & 0xFF
            )

            self.init(
                red: CGFloat(r) / 255,
                green: CGFloat(g) / 255,
                blue: CGFloat(b) / 255,
                alpha: alpha
            )
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (
                rgbValue >> 24,
                rgbValue >> 16 & 0xFF,
                rgbValue >> 8 & 0xFF,
                rgbValue & 0xFF
            )

            self.init(
                red: CGFloat(r) / 255,
                green: CGFloat(g) / 255,
                blue: CGFloat(b) / 255,
                alpha: CGFloat(a) / 255
            )
        default:
            self.init(white: 1, alpha: alpha)
        }
    }
    
    static func blend(from: UIColor, to: UIColor, percent: Double) -> UIColor {
        var fR : CGFloat = 0.0
        var fG : CGFloat = 0.0
        var fB : CGFloat = 0.0
        var tR : CGFloat = 0.0
        var tG : CGFloat = 0.0
        var tB : CGFloat = 0.0

        from.getRed(&fR, green: &fG, blue: &fB, alpha: nil)
        to.getRed(&tR, green: &tG, blue: &tB, alpha: nil)

        let dR = tR - fR
        let dG = tG - fG
        let dB = tB - fB

        let rR = fR + dR * CGFloat(percent)
        let rG = fG + dG * CGFloat(percent)
        let rB = fB + dB * CGFloat(percent)

        return UIColor(red: rR, green: rG, blue: rB, alpha: 1.0)
    }
}
