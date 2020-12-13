//
//  NetworkResponse.swift
//  MANetworkJSONDataManager
//
//  Created by Mahjabin Alam on 2020/12/13.
//

import Foundation

struct NetworkResponse<T: Codable>:Decodable{
    var response: [T]?
    var error: String?
}
