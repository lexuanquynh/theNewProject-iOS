//
//  SelfPracticeUsecase.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import Foundation
import RxSwift

/* This is auth usecase class implentation from AbstractAuthUsecase. Which will be used to get user auth related data from user repository*/
class SelfPracticeUsecase: AbstractSelfPracticeUsecase {
    let repository: AbstractRepository
    
    public init(repository: AbstractSelfPracticeRepository) {
        self.repository = repository
    }
    
}
