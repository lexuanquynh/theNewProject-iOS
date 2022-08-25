//
//  AuthViewModel.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation
import RxSwift
import RxCocoa

/* This is my auth viewmodel class implementation of AbstractAuthViewModel. Which will be used to user related data by its usecase*/
class AuthViewModel: AbstractAuthViewModel {
    // This struct will be used get event with data from viewcontroller
    struct AuthInput {
        
    }
    
    // This struct will be used to send event with observable data/response to viewcontroller
    struct AuthOutput {
    }
    
    let disposeBag = DisposeBag()
    let usecase: AbstractUsecase
    
    init(usecase: AbstractAuthUsecase) {
        self.usecase = usecase
    }
    
}
