//
//  HomeCoordinator.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/26/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let repository = HomeRepository(
                localDataSource: HomeLocalDataSource(dbClient: DatabaseClient.shared),
                remoteDataSource: HomeRemoteDataSource(apiClient: ApiClient.shared
            )
        )
            
        let usecase = HomeUsecase(repository: repository)
        let viewModel = HomeViewModel(usecase: usecase)
        let vc = HomeViewController(viewModel: viewModel)
        vc.coordinator = self
        self.navigationController.viewControllers = [vc]
    }
    
    func navigateSelfPracticeScreen() {
        let selfPracticeCoordinator = SelfPracticeCoordinator(navigationController: navigationController)
        
        selfPracticeCoordinator.start()
    }
}
