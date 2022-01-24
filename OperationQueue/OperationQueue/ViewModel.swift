//
//  ViewModel.swift
//  OperationQueue
//
//  Created by HariPanicker on 24/01/22.
//

import Foundation


class ViewModel {
    let baseUrl = "https://i.annihil.us/u/prod/marvel/i/mg"
    let imageLinks = ["/3/a0/537ba3793915b/standard_xlarge.jpg",
                      "/9/30/538cd33e15ab7/standard_xlarge.jpg",
                      "/6/a0/55b6a25e654e6/standard_xlarge.jpg",
                      "/1/c0/537ba2bfd6bab/standard_xlarge.jpg",
                      "/5/c0/537ba730e05e0/standard_xlarge.jpg",
                      "/3/50/537ba56d31087/standard_xlarge.jpg",
                      "/6/90/54ad7297b0a59/standard_xlarge.jpg",
                      "/c/10/537ba5ff07aa4/standard_xlarge.jpg",
                      "/c/10/537babe1c1f66/standard_xlarge.jpg",
                      "/2/60/537bcaef0f6cf/standard_xlarge.jpg",]
    
    var dataDict = [Int: Data]()
    
    init() {
    }
    
    func downloadImageAt(index: Int) -> Data? {
        let imageUrl = URL(string: baseUrl+imageLinks[index])!
        do {
            return try Data(contentsOf: imageUrl)
        } catch {
            return nil
        }
    }
    
    func dataAt(index: Int) -> Data? {
        if let data = self.dataDict[index] {
            return data
        }
        return nil
    }
    
    func startDownloading(completion: @escaping() -> Void) {
        let operation = BlockOperation()
        operation.addExecutionBlock {
            for i in 0..<10 {
                if let data = self.downloadImageAt(index: i) {
                    self.dataDict[i] = data
                    completion()
                }
            }
        }
        operation.start()
    }
}
