//
//  AddToIPHubStep3ViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/5/2.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class AddToIPHubStep3ViewController: UIViewController {

    @IBOutlet weak var subLogo: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var addDifferentButton: UIButton!
    @IBOutlet weak var typeSomethingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = NSLocalizedString("ADD to <Hub_name>", comment:"StepOne")
        subTitle.text = NSLocalizedString("Step 3", comment:"StepOne")
        subTitle.textColor = DefauleTheme.subTextColor
        
        doneButton.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forState: .Normal)
        doneButton.setBackgroundImage(getImageWithColor(DefauleTheme.SubColor, size: CGSizeMake(200, 200)), forState: .Highlighted)
        doneButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        doneButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
        
        addDifferentButton.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forState: .Normal)
        addDifferentButton.setBackgroundImage(getImageWithColor(DefauleTheme.SubColor, size: CGSizeMake(200, 200)), forState: .Highlighted)
        addDifferentButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        addDifferentButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
        
        typeSomethingButton.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forState: .Normal)
        typeSomethingButton.setBackgroundImage(getImageWithColor(DefauleTheme.SubColor, size: CGSizeMake(200, 200)), forState: .Highlighted)
        typeSomethingButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        typeSomethingButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        //回到首頁
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func addDifferentButtonPressed(sender: AnyObject) {
        //回到1-1
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func typeSomethingButtonPressed(sender: AnyObject) {
        //回到1-3
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
