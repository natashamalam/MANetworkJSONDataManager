//
//  MANetworkSessionManager.swift
//  MANetworkJSONDataManager
//
//  Created by Mahjabin Alam on 2020/12/13.
//

import Foundation

class MANetworkSessionManager{
    
    public static let sharedInstance = MANetworkSessionManager()
    private init(){}
    let utilityClaas = UtilityClass()
    
    
    public func getData<T:Decodable>(from urlString: String, type:T.Type, completed: @escaping(Result<NetworkResponse<T>, NetworkError>)->()){
        guard let url = URL(string: urlString) else{
            return completed(.failure(NetworkError.invalidURL))
        }
       
        let dataTask =  URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error as? NetworkError{
                completed(.failure(err))
                return
            }
            if let response = response as? HTTPURLResponse{
                 if response.statusCode < 200 || response.statusCode > 299{
                    completed(.failure(self.utilityClaas.getNetworkError(from: response)))
                    return
                 }
            }
            
            guard let data = data else{
                return completed(.failure(NetworkError.invalidData))
            }
            do{
                let jsonResponse = try JSONDecoder().decode(NetworkResponse<T>.self, from: data)
                completed(.success(jsonResponse))
            }catch{
                completed(.failure(NetworkError.decodingFailed))
            }
        }
        dataTask.resume()
    }
    
    
    public func postData<T:Codable>(ofType type:T.Type, fromURL urlString: String, withMethod method: String, andParameter parameter: [String:String], usingContentType contentType: String?, completed: @escaping(Result<NetworkResponse<T>, NetworkError>)->()){
        
        guard let url = URL(string: urlString) else{
            return completed(.failure(NetworkError.invalidURL))
        }
        var httpBody: Data?
        do{
            httpBody = try JSONEncoder().encode(parameter)
            guard let body = httpBody else {
                return completed(.failure(.invalidData))
            }
            
            let requestManager = NetworkRequest(withURL:url, httpBody:body, contentType:contentType, andMethod:method)
            let urlRequest = requestManager.urlRequest()
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {  (data, response, error) in
                if let error = error as? NetworkError{
                    completed(.failure(error))
                    return
                }
                if let response = response as? HTTPURLResponse{
                     if response.statusCode < 200 || response.statusCode > 299{
                        completed(.failure(self.utilityClaas.getNetworkError(from: response)))
                        return
                     }
                }
               
                guard let responseData = data else{
                    completed(.failure(NetworkError.invalidData))
                    return
                }
                
                do{
                    let jsonResponse = try JSONDecoder().decode(NetworkResponse<T>.self, from: responseData)
                    completed(.success(jsonResponse))
                }catch{
                    completed(.failure(NetworkError.decodingFailed))
                }
            }
            dataTask.resume()
        }catch{
            completed(.failure(.ecodingFailed))
        }
    }
    
}
