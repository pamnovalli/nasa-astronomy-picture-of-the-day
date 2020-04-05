//
//  AstronomyPictureViewController.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit
import Kingfisher

class AstronomyPictureViewController: UIViewController {
    
    let imageView = UIImageView()
    let label = UILabel()
    let titleLabel = UILabel()
    
    let viewModel = AstronomyPictureViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(label)
        setupLayout()
        
    }
    
    func setupLayout(){
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant:  100).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40).isActive = true
        titleLabel.textColor = UIColor.purple
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        label.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        label.contentCompressionResistancePriority(for: .horizontal)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadAstronomyPictures()
    }

}

extension AstronomyPictureViewController: AstronomyPictureViewModelProtocol {
    func didloadAstronomyPictures() {
        DispatchQueue.main.async{
            self.titleLabel.text = self.viewModel.astronomyPicture?.title
            self.label.text = self.viewModel.astronomyPicture?.explanation
            self.imageView.kf.setImage(with: URL(string: self.viewModel.astronomyPicture!.url))

        }
    }
    
    
}
