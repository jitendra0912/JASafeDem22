//
//  ModuleAPI.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 06/12/22.
//

import Foundation


struct ModuleAPI: APIHandler {
    
    func makeRequest(from param: String) -> URLRequest? {
        let urlString =  APIPath().moduleAPI
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Foundation.Data?, response: HTTPURLResponse) throws -> StaticSideMenuModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
