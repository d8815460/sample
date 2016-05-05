//
//  AddToIPHubViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/5/2.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class AddToIPHubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var subLogo: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    var selectIndexPath: NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = NSLocalizedString("ADD", comment:"StepOne")
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 115
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        if selectIndexPath.row == 1 {
            self.performSegueWithIdentifier("1-6", sender: sender)
        } else {
            self.performSegueWithIdentifier("1-3", sender: sender)
        }
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
