//
//  ViewController.swift
//  OperationQueue
//
//  Created by HariPanicker on 23/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var tableview: UITableView!
    
    let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.reloadData()
        viewModel.startDownloading {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "DisplayCell") as! DisplayCell
        guard let data = viewModel.dataAt(index: indexPath.row) else {
            cell.loadData(index: indexPath.row, image: nil)
            return cell
        }
        let image = UIImage(data:data)
        cell.loadData(index: indexPath.row, image: image)
        return cell
    }
}

class DisplayCell: UITableViewCell {
    
    @IBOutlet private var indexLabel: UILabel!
    @IBOutlet private var displayImageView: UIImageView!
    
    func loadData(index: Int, image: UIImage?) {
        indexLabel.text = "\(index)"
        displayImageView.image = image
    }
}
