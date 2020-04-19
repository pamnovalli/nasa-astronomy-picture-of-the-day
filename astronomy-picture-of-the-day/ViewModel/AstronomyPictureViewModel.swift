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
    private let apiCalling: APICalling
    private let dispose: DisposeBag
    private let requester: APIRequester
    var delegate: AstronomyPictureViewModelProtocol?
    var astronomyPicture: AstronomyPicture?
    
    init(apiCalling: APICalling = APICalling(),
         requester: APIRequester = APIRequester(),
         dispose: DisposeBag = DisposeBag()
    ) {
        self.apiCalling = apiCalling
        self.requester = requester
        self.dispose = dispose
    }
    
    func loadAstronomyPictures() {
        let result : Observable<AstronomyPicture> = apiCalling.send(apiRequest: requester)
        result.observeOn(MainScheduler.instance)
            .subscribe(onNext: { (astronomyPicture: AstronomyPicture) in
                self.astronomyPicture = astronomyPicture
                self.delegate?.didloadAstronomyPictures()
                })
            .disposed(by: dispose)
    }
    
}

