//
//  TermWebViewController.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/4/15.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class TermWebViewController: UIViewController {

    @IBOutlet internal weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let url = NSURL (string: "http://www.google.com")
//        let requestObj = NSURLRequest(URL: url!)
//        webView.loadRequest(requestObj)
//        webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.google.com")!))
        let myWebView:UIWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.google.com")!))
        self.view.addSubview(myWebView)
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
