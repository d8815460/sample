//
//  CategoryCell.swift
//  CommonUX
//
//  Created by 駿逸 陳 on 2016/4/26.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class CategoryCellModel: SACellModel {
    let title           : String
    var image           : UIImage
    var imagePressed    : UIImage
    
    init(title: String, image: UIImage, imagePressed: UIImage, selectionHandler: SASelectionHandler?) {
        self.title          = title
        self.image          = image
        self.imagePressed   = imagePressed
        let size = CGSize(width: 110, height: 125)
        super.init(cellType: CategoryCell.self, size: size, selectionHandler: selectionHandler)
    }
}


class CategoryCell: SACell, SACellType {
    typealias CellModel = CategoryCellModel
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func configure() {
        super.configure()
        
        guard let cellmodel = cellmodel else {
            return
        }
        
        titleLabel.text = cellmodel.title
        imageView.image = cellmodel.image
    }
    
    override func willDisplay(collectionView: UICollectionView) {
        super.willDisplay(collectionView)
    }
}
