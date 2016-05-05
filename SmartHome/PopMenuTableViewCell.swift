//
//  PopMenuTableViewCell.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/22.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

public class PopMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewThumbnail: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    
    public var expanded = false
    
    public var expandable = true {
        didSet{
            if (expandable) {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 8))
                let layer = CAShapeLayer()
                let path = UIBezierPath()
                path.moveToPoint(CGPointMake(0, 0))
                path.addLineToPoint(CGPointMake(8, 8))
                path.addLineToPoint(CGPointMake(16, 0))
                layer.path = path.CGPath;
                layer.strokeColor = UIColor.whiteColor().CGColor
                layer.fillColor = UIColor.clearColor().CGColor
                view.layer.addSublayer(layer)
                self.accessoryView = view
            }
        }
    }
    
    let kIndicatorViewTag = -1
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {super.init(style: style, reuseIdentifier: reuseIdentifier)}
    required public init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    public func accessoryViewAnimation() {
        UIView.animateWithDuration(0.2){
            if (self.expanded) {
                self.accessoryView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI));
            } else {
                self.accessoryView!.transform = CGAffineTransformMakeRotation(0);
            }
        }
    }
}