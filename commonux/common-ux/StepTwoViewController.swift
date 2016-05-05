//
//  StepTwoViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/4/25.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class StepTwoViewController: UIViewController {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var subLogo: UIImageView!
    @IBOutlet weak var IPHubRegisteredLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("ADD", comment:"StepOne")
        subTitle.text = NSLocalizedString("Step 2", comment:"StepTwo")
        subTitle.textColor = DefauleTheme.subTextColor
        // Do any additional setup after loading the view.
        
        
    
        doneButton.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forState: .Normal)
        doneButton.setBackgroundImage(getImageWithColor(DefauleTheme.SubColor, size: CGSizeMake(200, 200)), forState: .Highlighted)
        doneButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        doneButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
