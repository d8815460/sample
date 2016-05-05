//
//  CantRegisterIPHubViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/4/30.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class CantRegisterIPHubViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var haveIpHubButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = NSLocalizedString("ADD", comment:"StepOne")
        titleLabel.text = NSLocalizedString("Cannot register the IP Hub.", comment:"Timeout")
        titleLabel.textColor = DefauleTheme.subTextColor
        // Do any additional setup after loading the view.
        
        
        
        okButton.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forState: .Normal)
        okButton.setBackgroundImage(getImageWithColor(DefauleTheme.SubColor, size: CGSizeMake(200, 200)), forState: .Highlighted)
        okButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        okButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
        
        haveIpHubButton.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forState: .Normal)
        haveIpHubButton.setBackgroundImage(getImageWithColor(DefauleTheme.SubColor, size: CGSizeMake(200, 200)), forState: .Highlighted)
        haveIpHubButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        haveIpHubButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - private func
    
    private func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    @IBAction func okButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("noIPHub", sender: nil)
    }
    
    @IBAction func haveIPHubButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("haveIPHub", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
