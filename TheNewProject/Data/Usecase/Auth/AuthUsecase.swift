//
//  AuthUsecase.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation
import RxSwift

/* This is auth usecase class implentation from AbstractAuthUsecase. Which will be used to get user auth related data from user repository*/
class AuthUsecase: AbstractAuthUsecase {
    let repository: AbstractRepository
    
    public init(repository: AbstractAuthRepository) {
        self.repository = repository
    }
    
}
