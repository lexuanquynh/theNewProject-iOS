//
//  SelfPracticeCoordinator.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import UIKit

class SelfPracticeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
        let repository = SelfPracticeRepository(
                localDataSource: SelfPracticeLocalDataSource(dbClient: DatabaseClient.shared),
                remoteDataSource: SelfPracticeRemoteDataSource(apiClient: ApiClient.shared
            )
        )
            
        let usecase = SelfPracticeUsecase(repository: repository)
        let viewModel = SelfPracticeViewModel(usecase: usecase)
        let vc = SelfPracticeViewController(viewModel: viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
//        self.navigationController.viewControllers = [vc]
    }
}

