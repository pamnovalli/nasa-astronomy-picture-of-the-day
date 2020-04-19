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
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        let screensize: CGRect = UIScreen.main.bounds
        scroll.backgroundColor = .white
        scroll.frame = CGRect(x: 0, y: 0, width: screensize.width, height: screensize.height)
        scroll.contentSize = contentViewSize
        return scroll
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
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
        setupLayout()
        
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant:  10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
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
