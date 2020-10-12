//
//  Extensions.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 06/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var palova: UIColor {
        return #colorLiteral(red: 0.7254901961, green: 0.6274509804, blue: 0.537254902, alpha: 1)
    }
    
    class var charcoal: UIColor {
        return #colorLiteral(red: 0.2941176471, green: 0.2862745098, blue: 0.2823529412, alpha: 1)
    }
    
    class var suva: UIColor {
        return #colorLiteral(red: 0.5529411765, green: 0.5294117647, blue: 0.5176470588, alpha: 1)
    }
    
    class var martini: UIColor {
        return #colorLiteral(red: 0.7176470588, green: 0.6862745098, blue: 0.6705882353, alpha: 1)
    }
    
    convenience init(hexString: String?, alpha: CGFloat = 1.0) {
        
        guard let hex_String = hexString else { self.init(red:0.0, green:0.0, blue:0.0, alpha:0); return }
        
        let hexString: String = hex_String.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        let start = hexString.index(hexString.startIndex, offsetBy: 1)
        let hexColor = String(hexString[start...])
        
        if hexColor.count == 8 {
            let r, g, b, a: CGFloat
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                
                self.init(red: r, green: g, blue: b, alpha: a)
                
            } else {
                self.init(red:0.0, green:0.0, blue:0.0, alpha:0); return
            }
            
        } else {
            var color: UInt32 = 0
            scanner.scanHexInt32(&color)
            let mask = 0x000000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            self.init(red:red, green:green, blue:blue, alpha:alpha)
        }
    }
}

extension UIFont {
    class func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Ubuntu", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func medium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Ubuntu-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Ubuntu-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
}

extension UIView {
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        //layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}

public class InsetLabel: UILabel {
    
    public var edgeInset = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        
        let insetRect = bounds.inset(by: edgeInset)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -edgeInset.top,
                                          left: -edgeInset.left,
                                          bottom: -edgeInset.bottom,
                                          right: -edgeInset.right)
        return textRect.inset(by: invertedInsets)
    }
    
    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: edgeInset))
    }
    
}

extension InsetLabel {
    @IBInspectable
    var leftEdgeInset: CGFloat {
        set { edgeInset.left = newValue }
        get { return edgeInset.left }
    }
    
    @IBInspectable
    var rightEdgeInset: CGFloat {
        set { edgeInset.right = newValue }
        get { return edgeInset.right }
    }
    
    @IBInspectable
    var topEdgeInset: CGFloat {
        set { edgeInset.top = newValue }
        get { return edgeInset.top }
    }
    
    @IBInspectable
    var bottomEdgeInset: CGFloat {
        set { edgeInset.bottom = newValue }
        get { return edgeInset.bottom }
    }
}

