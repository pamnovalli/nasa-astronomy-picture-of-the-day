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
    
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.frame = UIScreen.main.bounds
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel =  {
        let label = UILabel()
        label.textColor = UIColor.purple
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        label.contentCompressionResistancePriority(for: .horizontal)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let viewModel = AstronomyPictureViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(imageView)
        containerView.addSubview(descriptionLabel)
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 400).isActive = true
        setupLayout()
    }

    func setupLayout(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -80),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant:  50),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 300),
            imageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadAstronomyPictures()
    }
    
}

extension AstronomyPictureViewController: AstronomyPictureViewModelProtocol {
    func didloadAstronomyPictures() {
        DispatchQueue.main.async{
            self.titleLabel.text = self.viewModel.astronomyPicture?.title
            self.descriptionLabel.text = self.viewModel.astronomyPicture?.explanation
            guard let url = self.viewModel.astronomyPicture?.url else { return }
            self.imageView.kf.setImage(with: URL(string: url))
    }
    
  }

}
