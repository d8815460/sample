//
//  AddLightToIPHubViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/5/2.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class AddLightToIPHubViewController: UIViewController {

    @IBOutlet weak var subLogo: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = NSLocalizedString("ADD to <Hub_name>", comment:"StepOne")
        subTitle.text = NSLocalizedString("Step 1", comment:"StepOne")
        subTitle.textColor = DefauleTheme.subTextColor
        
        nextButton.setBackgroundImage(UIImage(named: "btn_next_n.png"), forState: .Normal)
        nextButton.setBackgroundImage(UIImage(named: "btn_next_h.png"), forState: .Highlighted)
        nextButton.setTitleColor(DefauleTheme.mainTextFieldColor, forState: .Normal)
        nextButton.setTitleColor(DefauleTheme.subTextColor, forState: .Highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
