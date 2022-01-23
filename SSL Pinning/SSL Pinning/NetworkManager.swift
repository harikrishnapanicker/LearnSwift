//
//  NetworkManager.swift
//  SSL Pinning
//
//  Created by HariPanicker on 22/01/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private let certificates = ["www.netguru.com": PinnedCertificatesTrustEvaluator(certificates: [Certificates.netguru], acceptSelfSignedCertificates: false, performDefaultValidation: true, validateHost: true)]
    
    
    /// `Session` instance of `Alamofire` that creates and manages `Request` types during their lifetimes.
    let session: Session
    
    init() {
        let serverTrustManager = ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: certificates)
        
        self.session = Session(serverTrustManager: serverTrustManager)
    }
    
    func request(_ convertible: URLRequestConvertible) -> DataRequest {
        return session.request(convertible)
    }
}

