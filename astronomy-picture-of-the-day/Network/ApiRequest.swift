//
//  ApiRequest.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

class APIRequester {
    
   private let method: RequestType
   private let url: String
    
    init(url: String = Endpoint.baseUrl,
         method: RequestType = RequestType.GET
    ) {
        self.method = method
        self.url = url
    }
    
    func request() -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        request.addValue("aplication/json", forHTTPHeaderField: "Accept")
        return request
    }
    
}
