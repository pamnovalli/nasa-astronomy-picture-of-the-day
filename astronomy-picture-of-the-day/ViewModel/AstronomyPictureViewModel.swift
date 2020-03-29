//
//  AstronomyPictureViewModel.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation
import RxSwift

protocol AstronomyPictureViewModelProtocol {
    func didloadAstronomyPictures()
    
}

class AstronomyPictureViewModel {
    
    private let apiCalling = APICalling()
    private let disposeBag = DisposeBag()
    private let request = APIRequest()
    var delegate: AstronomyPictureViewModelProtocol?
    
    func loadAstronomyPictures() {
        let result : Observable<AstronomyPicture> = apiCalling.send(apiRequest: request)
        result.observeOn(MainScheduler.instance)
            .subscribe(onNext: { (astronomyPicture: AstronomyPicture) in
                print(astronomyPicture)
                })
            .disposed(by: disposeBag)
    }
    
}

