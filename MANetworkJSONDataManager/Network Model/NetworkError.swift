//
//  NetworkError.swift
//  MANetworkJSONDataManager
//
//  Created by Mahjabin Alam on 2020/12/13.
//

import Foundation

enum NetworkError: String, Error, Decodable {
    case invalidURL = "Invalid URL"
    case decodedWithError = "Decoded with error"
    case invalidData = "Data Corrupted"
    case decodingFailed = "Json Decoding failed"
    case ecodingFailed = "Json ecoding failed"
    case noUpdateRequired = "No Update Required"
    case badRequest = "Bad Request" //400
    case unauthorizedRequest = "Unauthorized Request" //401
    case forbidden = "Forbidden Action" //403
    case notFound = "Content Not Found" //404
    case methodNotAllowed = "Method Not Allowed" //405
    case timeOut = "Request Time Out" //408
    case unsupportedMediaType = "Unsupported Media Type" //415
    case serverError = "Server Error" //500
    case serviceUnavailable = "Service Unavailable" //503
    case unknownError = "unKnownError"
}
