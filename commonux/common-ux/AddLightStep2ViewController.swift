//
//  AddLightStep2ViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/5/2.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import Parse

class AddLightStep2ViewController: UIViewController {

    @IBOutlet weak var subLogo: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var ledButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = NSLocalizedString("ADD to <Hub_name>", comment:"StepOne")
        subTitle.text = NSLocalizedString("Step 2", comment:"StepOne")
        subTitle.textColor = DefauleTheme.subTextColor
        
        stopButton.setBackgroundImage(getImageWithColor(DefauleTheme.MainColor, size: CGSizeMake(200, 200)), forState: .Normal)
        stopButton.setBackgroundImage(getImageWithColor(DefauleTheme.SubColor, size: CGSizeMake(200, 200)), forState: .Highlighted)
        stopButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        stopButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ledButtonPressed(sender: AnyObject) {
        PFAlertView.showAlertWithTitle(NSLocalizedString("The LED still does not blink?", comment: "setup"), message: NSLocalizedString("Reconnect your IP Hub. Make sure your network can connect to the Internet.", comment: "setup"), cancelButtonTitle: NSLocalizedString("OK", comment: "setup"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
        })
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        PFAlertView.showAlertWithTitle(NSLocalizedString("The LED still does not blink?", comment: "setup"), message: NSLocalizedString("X light bulbs are registered. Do you want to try?", comment: "setup"), cancelButtonTitle: NSLocalizedString("I'm done.", comment: "setup"), otherButtonTitles: [NSLocalizedString("Retry", comment: "setup")], completion: { (selectedOtherButtonIndex) in
            // otherButton, first = 0, second = 1
            if selectedOtherButtonIndex != 0 {
                self.performSegueWithIdentifier("1-9", sender: sender)
            }
        })
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
