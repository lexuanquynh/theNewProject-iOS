//
//  SelfPracticeViewModel.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/* This is my auth viewmodel class implementation of AbstractAuthViewModel. Which will be used to user related data by its usecase*/
class SelfPracticeViewModel: AbstractSelfPracticeViewModel {
    // This struct will be used get event with data from viewcontroller
    struct SelfPracticeInput {
        
    }
    
    // This struct will be used to send event with observable data/response to viewcontroller
    struct SelfPracticeOutput {
    }
    
    let disposeBag = DisposeBag()
    let usecase: AbstractUsecase
    
    init(usecase: AbstractSelfPracticeUsecase) {
        self.usecase = usecase
    }
    
    func getSelfPracticeOutput(input: SelfPracticeInput) -> SelfPracticeOutput {
        return SelfPracticeOutput()
    }
    
}
