//
//  UtilityClass.swift
//  MANetworkJSONDataManager
//
//  Created by Mahjabin Alam on 2020/12/13.
//

import Foundation

class UtilityClass{

    
    public func getNetworkError(from response: HTTPURLResponse)->NetworkError{
        if response.statusCode  == 400{
            return .badRequest
        }
        else if response.statusCode == 401{
            return .unauthorizedRequest
        }
        else if response.statusCode == 403{
            return .forbidden
        }
        else if response.statusCode == 404{
            return .notFound
        }
        else if response.statusCode == 405{
            return .methodNotAllowed
        }
        else if response.statusCode == 408{
            return .timeOut
        }
        else if response.statusCode == 415{
            return .unsupportedMediaType
        }
        else if response.statusCode == 500{
            return .serverError
        }
        else if response.statusCode == 503{
            return .serviceUnavailable
        }
        else{
            return .unknownError
        }
    }
    
    func networkResponseError(_ response: HTTPURLResponse)-> NetworkError?{
        if response.statusCode < 200 || response.statusCode > 299{
            let networkError = getNetworkError(from:response)
            return networkError
        }
        return nil
    }
    
    func deepDebug(_ error: Error){
        print("Decoding failed with error: \(error)")
    }
    
}
