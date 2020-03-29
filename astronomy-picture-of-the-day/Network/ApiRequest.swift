//
//  ApiRequest.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

class APIRequest {
    
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod?api_key=FAKgn6usJQaAdfsKIbMbd7OYI0vU8sPMuA467GPK")
    var method = RequestType.GET
    
    
    func request(with baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        request.addValue("aplication/json", forHTTPHeaderField: "Accept")
        return request
    }
    
}
