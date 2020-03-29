//
//  AstronomyPictureViewController.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class AstronomyPictureViewController: UIViewController {
    
    let viewModel = AstronomyPictureViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadAstronomyPictures()
    }

}

extension AstronomyPictureViewController: AstronomyPictureViewModelProtocol {
    func didloadAstronomyPictures() {
        
    }
    
    
}
