//
//  StepOneViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/4/22.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import Parse

class StepOneViewController: UIViewController {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var subLogo: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = NSLocalizedString("ADD", comment:"StepOne")
        subTitle.text = NSLocalizedString("Step 1", comment:"StepOne")
        subTitle.textColor = DefauleTheme.subTextColor
        firstLabel.text = NSLocalizedString("Connect power cord and LAN cable.\nConnect your phone to the same network with the IP Hub.", comment:"StepOne")
        secondLabel.text = NSLocalizedString("Wait for IP Hub to blink.", comment:"StepOne")
        thirdLabel.text = NSLocalizedString("Press pair key for 3s.", comment:"StepOne")
        
        firstLabel.numberOfLines = 0
        secondLabel.numberOfLines = 0
        thirdLabel.numberOfLines = 0
        
        nextButton.setBackgroundImage(UIImage(named: "btn_next_n.png"), forState: .Normal)
        nextButton.setBackgroundImage(UIImage(named: "btn_next_h.png"), forState: .Highlighted)
        nextButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        nextButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func secondButtonPressed(sender: AnyObject) {
        PFAlertView.showAlertWithTitle(NSLocalizedString("The LED still does not blink?", comment: "setup"), message: NSLocalizedString("Reconnect your IP Hub. Make sure your network can connect to the Internet.", comment: "setup"), cancelButtonTitle: NSLocalizedString("OK", comment: "setup"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
        })
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
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
