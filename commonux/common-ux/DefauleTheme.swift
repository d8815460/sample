//
//  DefauleTheme.swift
//  Mega
//
//  Created by 駿逸 陳 on 2016/4/8.
//  Copyright © 2016年 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

public class DefauleTheme {
    
    public init() { }
    
    
    
    public class var getDeviceType : String {
        let screenSize : CGSize = UIScreen.mainScreen().bounds.size
        let screenWidth : CGFloat = screenSize.width
        let screenHeight : CGFloat = screenSize.height
        
        if screenWidth == 320 && screenHeight == 568{
            // iphone5
            return "iphone5"
        } else if screenWidth == 375 && screenHeight == 667 {
            // iphone6
            return "iphone6"
        } else if screenWidth == 414 && screenHeight == 736 {
            // iphone6plus
            return "iphone6plus"
        } else {
            // iphone4以下
            return "iphone4"
        }
    }
    
    public class var fontName : String {
        return "Avenir-Book"
    }
    
    public class var boldFontName : String {
        return "Avenir-Black"
    }
    
    public class var semiBoldFontName : String {
        return "Avenir-Heavy"
    }
    
    public class var lighterFontName : String {
        return "Avenir-Light"
    }
    
    public class var darkColor : UIColor {
        return UIColor.blackColor()
    }
    
    public class var lightColor : UIColor {
        return UIColor(white: 0.6, alpha: 1.0)
    }
    
    public class var clearColor : UIColor {
        return UIColor.clearColor()
    }
    
    public class var whiteColor : UIColor {
        return UIColor.whiteColor()
    }
    
    public class var loginWhiteColor : UIColor {
        return UIColor(red: 225.0/255.0, green: 233.0/255.0, blue: 240.0/255.0, alpha: 1)
    }
    
    // TextField主要顏色
    public class var mainTextFieldColor : UIColor {
        return whiteColor
    }
    
    // Text 副色系
    public class var subTextColor : UIColor {
        return whiteColor
    }
    
    // TextFieldPlaceholder
    public class var textPlaceholderColor : UIColor {
        return ThirdColor
    }
    
    
    // 主要顏色（MainColor）
    public class var MainColor : UIColor {
        return Navy
    }
    
    // 次要顏色（SubColor）
    public class var SubColor : UIColor {
        return SteelBlue
    }
    
    // 第3顏色（ThirdColor）
    public class var ThirdColor : UIColor {
        return PowderBlue
    }
    
    
    
    // 海軍藍（Navy）
    public class var Navy : UIColor {
        return UIColor(red: 0.0, green: 66.0/255.0, blue: 130.0/255.0, alpha: 1)
    }
    
    // 鋼藍（SteelBlue）
    public class var SteelBlue : UIColor {
        return UIColor(red: 38.0/255.0, green: 141.0/255.0, blue: 205.0/255.0, alpha: 1)
    }
    
    // 粉藍（PowderBlue）
    public class var PowderBlue : UIColor {
        return UIColor(red: 104.0/255.0, green: 185.0/255.0, blue: 225.0/255.0, alpha: 1)
    }
    
    // 咖啡黑（BlackCoffee）
    public class var BlackCoffee : UIColor {
        return UIColor(red: 75.0/255.0, green: 71.0/255.0, blue: 67.0/255.0, alpha: 1)
    }
    
    // 按鈕主色
    public class var buttonMainColor : UIColor {
        return UIColor.whiteColor()
    }
    
    // 按鈕被壓住的顏色
    public class var buttonHighlightedColor : UIColor {
        return PowderBlue
    }
    
    // 按鈕被選擇的顏色
    public class var buttonSelectedColor : UIColor {
        return BlackCoffee
    }
    
    
    
    
    
    public func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func customizeAppAppearance() {
        let navAppearance = UINavigationBar.appearance()
        let backImage = UIImage( named: "back")
        
        // 設置導航欄，變得透明與否
        navAppearance.translucent = false
        // 返回鍵
        navAppearance.backIndicatorImage = backImage
        navAppearance.backIndicatorTransitionMaskImage = backImage
        navAppearance.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forBarMetrics: UIBarMetrics.Default)
        navAppearance.tintColor = DefauleTheme.mainTextFieldColor
        
        
        // 設置ToorBar，變得透明與否
        let toolbarAppearance = UIToolbar.appearance()
        toolbarAppearance.translucent = false
        toolbarAppearance.tintColor = DefauleTheme.mainTextFieldColor
        toolbarAppearance.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forToolbarPosition: .Any, barMetrics: UIBarMetrics.Default)
        
        var textAttributes : [String : AnyObject] = [String : AnyObject]()
        textAttributes[NSForegroundColorAttributeName] = UIColor.whiteColor()
        textAttributes[NSFontAttributeName] = UIFont(name: DefauleTheme.fontName, size: 19)
        
        navAppearance.titleTextAttributes = textAttributes
        
        let barButtonAppearance = UIBarButtonItem.appearance()
        barButtonAppearance.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: .Default)
        barButtonAppearance.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: .Compact)
        
        
        let buttonAppearance = UIButton.appearance()
        buttonAppearance.setTitleColor(DefauleTheme.MainColor,        forState: UIControlState.Normal)
        buttonAppearance.setTitleColor(DefauleTheme.buttonMainColor, forState: UIControlState.Highlighted)
        buttonAppearance.setTitleColor(DefauleTheme.BlackCoffee,    forState: UIControlState.Selected)
        
        buttonAppearance.setBackgroundImage(getImageWithColor(DefauleTheme.buttonMainColor, size: CGSizeMake(200, 200)), forState: UIControlState.Normal)
        buttonAppearance.setBackgroundImage(getImageWithColor(DefauleTheme.buttonHighlightedColor, size: CGSizeMake(200, 200)), forState: UIControlState.Highlighted)
        buttonAppearance.setBackgroundImage(getImageWithColor(DefauleTheme.buttonSelectedColor, size: CGSizeMake(200, 200)), forState: UIControlState.Selected)
        
        // 不知道為什麼layer陰影不work，待查
        buttonAppearance.layer.shadowColor = UIColor.blackColor().CGColor
        buttonAppearance.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        buttonAppearance.layer.masksToBounds = false
        buttonAppearance.layer.shadowRadius = 1.0
        buttonAppearance.layer.shadowOpacity = 0.5
        
        
        // TextField 
        let textfieldAppearance = UITextField.appearance()
        textfieldAppearance.textColor = DefauleTheme.mainTextFieldColor
        
        
        // AlertViewController
//        let alertViewController = UIAlertController.appearance()
//        alertViewController.tintColor = DefauleTheme.MainColor
        
    }
}