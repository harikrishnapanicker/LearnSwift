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
    let imagelinks2 = ["https://c4.wallpaperflare.com/wallpaper/128/887/619/spider-man-marvel-comics-comics-spider-wallpaper-preview.jpg", "https://c4.wallpaperflare.com/wallpaper/224/829/129/digital-digital-art-artwork-illustration-simple-hd-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/591/844/1024/spider-man-spider-video-games-superhero-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/584/718/481/spider-man-marvel-comics-black-background-superhero-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/143/344/969/spider-man-homecoming-2017-spider-man-marvel-comics-new-york-city-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/713/116/34/spider-man-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/713/116/34/spider-man-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/857/388/968/iron-man-marvel-comics-superhero-the-avengers-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/776/211/785/iron-man-marvel-comics-superhero-tony-stark-wallpaper-preview.jpg",
                       "https://c4.wallpaperflare.com/wallpaper/392/924/950/iron-man-marvel-comics-artwork-simple-background-wallpaper-preview.jpg"]
    
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
    
    // BlockOperation
    func downloadUsingBlockOperation(completion: @escaping() -> Void) {
        let operation = BlockOperation()
        operation.addExecutionBlock {
            for i in 0..<10 {
                if let data = self.downloadImageAt(index: i) {
                    self.dataDict[i] = data
                    completion()
                    sleep(2)
                }
            }
        }
        operation.start()
    }
    
    //OperationQueue
    func downloadUsingOperationQueue(completion: @escaping() -> Void) {
        let queue = OperationQueue()
        queue.addOperation {
            for i in 0..<10 {
                if let data = self.downloadImageAt(index: i) {
                    self.dataDict[i] = data
                    completion()
                    sleep(2)
                }
            }
        }
        queue.maxConcurrentOperationCount = 3
    }
    
    // DispatchQueue : Concurrent
    func downloadUsingDispatchQueue(completion: @escaping() -> Void) {
        let concurrentQueue = DispatchQueue(label: "concurrentqueue", attributes: .concurrent)
        concurrentQueue.async {
            for i in 0..<10 {
                if let data = self.downloadImageAt(index: i) {
                    self.dataDict[i] = data
                    completion()
                    sleep(2)
                }
            }
        }
    }
}
