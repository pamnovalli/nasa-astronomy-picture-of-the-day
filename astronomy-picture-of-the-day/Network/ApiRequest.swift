//
//  ApiRequest.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

class APIRequest {
    
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod?api_key=qFamLEfakF4DtHjxKb6BZcOu9wLC23nPZjBUIc91")
    var method = RequestType.GET
    
    
    func request(with baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        request.addValue("aplication/json", forHTTPHeaderField: "Accept")
        return request
    }
    
}
