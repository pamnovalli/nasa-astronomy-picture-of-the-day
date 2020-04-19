//
//  Astronomy Picture .swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct AstronomyPicture: Decodable {
    
    let date: String
    let explanation: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
    init(date: String, explanation: String,
         mediaType: String, serviceVersion: String, title: String, url: String) {
        self.date = date
        self.explanation = explanation
        self.mediaType = mediaType
        self.serviceVersion = serviceVersion
        self.title = title
        self.url = url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let date: String = try container.decode(String.self, forKey: .date)
        let explanation: String = try container.decode(String.self, forKey: .explanation)
        let mediaType: String = try container.decode(String.self, forKey: .mediaType)
        let serviceVersion: String = try container.decode(String.self, forKey: .serviceVersion)
        let title: String = try container.decode(String.self, forKey: .title)
        let url: String = try container.decode(String.self, forKey: .url)

        self.init(date: date, explanation: explanation,
        mediaType: mediaType, serviceVersion: serviceVersion, title: title, url: url)
    }
    
    
}
