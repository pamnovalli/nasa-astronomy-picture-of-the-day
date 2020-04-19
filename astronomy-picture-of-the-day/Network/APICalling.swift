//
//  APICalling.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit
import RxSwift


class APICalling {
    
    func send<T: Decodable>(apiRequest: APIRequester) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request()
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                do {
                    let model: AstronomyPicture = try JSONDecoder().decode(AstronomyPicture.self, from: data ?? Data())
                    observer.onNext(model as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
