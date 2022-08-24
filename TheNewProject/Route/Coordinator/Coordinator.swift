//
//  Coordinator.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import UIKit


protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    init(navigationController: UINavigationController)
    
    func start()
}


protocol Storyboarded {
    static func instantiate(viewModel: AbstractViewModel) -> Self
}

extension Storyboarded where Self: BaseViewController {
    static func instantiate(viewModel: AbstractViewModel) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        if #available(iOS 13.0, *) {
            let viewController = storyboard.instantiateViewController(identifier: className) as! Self
            viewController.viewModel = viewModel
            return viewController
        } else {
            // Fallback on earlier versions
            let viewController = storyboard.instantiateViewController(withIdentifier: className) as! Self
            viewController.viewModel = viewModel
            return viewController
        }
        
    }
}

