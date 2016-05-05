//
//  WebBrowserViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit

public class WebBrowserViewController: BaseViewController {

    @IBOutlet weak var webView: UIWebView!
    
    public var url: NSURL?;
    public var presentedModally = false;
    
    // MARK: - UI Events
    
    @IBAction func doGoBack() {
        webView.goBack();
    }
    
    @IBAction func doGoForward() {
        webView.goForward();
    }
    
    @IBAction func doClose() {
        if (presentedModally) {
            self.navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
        } else {
            self.navigationController?.popViewControllerAnimated(true);
        }
    }
    
    // MARK: - Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if self.url != nil {
            
        }else{
            self.url = NSURL(string:"http://www.google.com")
        }
        let request = NSURLRequest(URL:  self.url!);
        self.webView.loadRequest(request);
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Close", comment: "Button"), style: .Plain, target: self, action: #selector(WebBrowserViewController.doClose));
    }
}
