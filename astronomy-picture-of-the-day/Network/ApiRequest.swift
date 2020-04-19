//
//  ApiRequest.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

class APIRequester: Requestable {
    
   private let method: RequestType
   private let url: String
    
    init(url: String = Endpoint().baseUrl,
         method: RequestType = RequestType.GET
    ) {
        self.method = method
        self.url = url
    }
    
    func request() -> URLRequest {
        guard let url = URL(string: self.url) else { preconditionFailure("Convert Error")}
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("aplication/json", forHTTPHeaderField: "Accept")
        return request
    }
    
}
