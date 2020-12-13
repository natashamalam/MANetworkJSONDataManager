//
//  NetworkRequest.swift
//  MANetworkJSONDataManager
//
//  Created by Mahjabin Alam on 2020/12/13.
//

import Foundation

class NetworkRequest{
    
    var url: URL
    var httpHeaders: [String:String] = [:]
    var httpBody: Data?
    var httpMethod: String
    var contentType = "application/json"
     
    init(withURL url:URL, httpBody body:Data, contentType type:String?, andMethod method:String) {
        self.url = url
        self.httpBody = body
        self.httpMethod = method
        if let contentType = type{
            self.contentType = contentType
        }
    }
    
    func urlRequest()->URLRequest{
        var request = URLRequest(url: self.url)
        
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.httpBody = self.httpBody
        request.httpMethod = self.httpMethod
        return request
    }
    
    
}
