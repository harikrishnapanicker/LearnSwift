//
//  ViewController.swift
//  SSL Pinning
//
//  Created by HariPanicker on 22/01/22.
//

import UIKit

class ViewController: UIViewController {

    private let networking = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        startApi()
        // Do any additional setup after loading the view.
    }

    func startApi() {
        
        networking
            .request(Request())
            .response { response in
                switch response.result {
                case .success:
                    print("success")
                case .failure:
                    print("failure")
                    break
                }
            }
    }
}

