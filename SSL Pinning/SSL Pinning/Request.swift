//
//  Request.swift
//  SSL Pinning
//
//  Created by HariPanicker on 23/01/22.
//

import Alamofire

struct Request: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        return URLRequest(url: URL(string: "https://www.netguru.com")!)
    }
}
