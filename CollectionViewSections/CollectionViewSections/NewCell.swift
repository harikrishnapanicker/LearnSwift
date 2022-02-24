//
//  NewCell.swift
//  CollectionViewSections
//
//  Created by HariPanicker on 10/02/22.
//

import UIKit

class NewCell: UICollectionViewCell {
    
    @IBOutlet var content: UIView!

    func loadData(color: UIColor) {
        self.content.backgroundColor = color
    }
}
