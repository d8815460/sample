//
//  SimpleCell.swift
//  Example
//
//  Created by Le VanNghia on 6/29/15.
//  Copyright (c) 2015 Le Van Nghia. All rights reserved.
//

import UIKit
import CommonUX

class SimpleCellModel: SACellModel {
    internal let title   : String
    internal var des     : String
    internal var image   : UIImage
    internal var type    : String
    
    init(title: String, des: String, image: UIImage, type: String, selectionHandler: SASelectionHandler?) {
        self.title = title
        self.des = des
        self.image = image
        self.type = type
        let size = CGSize(width: 110, height: 125)
        super.init(cellType: SimpleCell.self, size: size, selectionHandler: selectionHandler)
    }
}

class SimpleCell: SACell, SACellType {
    typealias CellModel = SimpleCellModel
    
    @IBOutlet weak var titleLabel   : UILabel!
    @IBOutlet weak var desLabel     : UILabel!
    @IBOutlet weak var imageView    : UIImageView!
    var typeLabel : String!

    override func configure() {
        super.configure()
        
        guard let cellmodel = cellmodel else {
            return
        }
        
        titleLabel.text = cellmodel.title
        desLabel.text   = cellmodel.des
        imageView.image = cellmodel.image
    }
	
	override func willDisplay(collectionView: UICollectionView) {
		super.willDisplay(collectionView)
	}
}