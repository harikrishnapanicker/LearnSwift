//
//  ViewController.swift
//  CollectionViewSections
//
//  Created by HariPanicker on 10/02/22.
//

import UIKit

var cellColors : [UIColor] = [.red,.green,.yellow, .orange, .blue, .brown]

class ViewController: UIViewController {

    @IBOutlet var mycollectionview: UICollectionView!
    @IBOutlet var bottomCollectionView: UICollectionView!

    var mycollectionviewManager = MyCollectionManager(colors: cellColors)
    var bottomcollectionviewManager = BottomCollectionManager(colors: cellColors)

    override func viewDidLoad() {
        super.viewDidLoad()
        mycollectionview.dataSource = mycollectionviewManager
        bottomCollectionView.dataSource = bottomcollectionviewManager
        mycollectionview.reloadData()
        bottomCollectionView.reloadData()
    }
}

class MyCollectionManager: NSObject,  UICollectionViewDataSource {

    var colors : [UIColor]
    
    init(colors : [UIColor]) {
        self.colors = colors
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.loadData(color: colors[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
                // Customize headerView here
                return headerView
            }
        fatalError()
    }

}

class BottomCollectionManager: NSObject, UICollectionViewDataSource {
    
    var colors : [UIColor]
    
    init(colors : [UIColor]) {
        self.colors = colors
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCell", for: indexPath) as! NewCell
        cell.loadData(color: colors[indexPath.row])
        return cell
    }
}
