//
//  MADataProvider.swift
//  MANetworkJSONDataManager
//
//  Created by Mahjabin Alam on 2020/12/13.
//

import Foundation

class MADataProvider{
    
    static let sharedInstance = MADataProvider()
    private init(){}
    
    let sessionManager = MANetworkSessionManager.sharedInstance
    
    let utilityClaas = UtilityClass()
    
    func getPosts(from urlString:String, completed: @escaping(_ posts:[Post]?, _ error: String?)->()){
        
        sessionManager.getData(from: urlString, type: Post.self) { (result) in
            switch(result){
            case .failure(let error):
                completed(nil, error.rawValue)
            case .success(let responseObject):
                completed(responseObject.response, responseObject.error)
            }
        }
    }
}
