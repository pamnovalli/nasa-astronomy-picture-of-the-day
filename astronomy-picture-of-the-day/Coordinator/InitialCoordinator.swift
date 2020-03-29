//
//  InitialCoordinator.swift
//  astronomy-picture-of-the-day
//
//  Created by Pamela Ianovalli on 29/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class InitialCoordinator {
    
    var window: UIWindow
    var rootViewController: UIViewController
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds), viewController: UIViewController = UIViewController()) {
        self.window = window
        self.rootViewController = viewController
    }
    
    func start() {
        rootViewController = UIViewController(nibName: "AstronomyPictureViewController", bundle: Bundle.main)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
