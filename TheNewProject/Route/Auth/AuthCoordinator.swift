//
//  AuthCoordinator.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import UIKit

class AuthCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let repository = AuthRepository(
                localDataSource: AuthLocalDataSource(dbClient: DatabaseClient.shared),
                remoteDataSource: AuthRemoteDataSource(apiClient: ApiClient.shared
            )
        )
        let usecase = AuthUsecase(repository: repository)
        let viewModel = AuthViewModel(usecase: usecase)
        let vc = LoginViewController(viewModel: viewModel)
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateHomeScreen() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()        
    }
    
    func navigateForgotPasswordScreen() {
        print("Open the forget password screen")
    }
    
    func navigateRegisterScreen() {
        print("Open the register screen")
    }
}
