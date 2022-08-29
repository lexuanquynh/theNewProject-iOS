//
//  SelfPracticeRepository.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import Foundation
import RxSwift

/* This is auth repository class implementation from AbstractAuthRepository. Which will be used to get user auth related data from api client/server response*/
class SelfPracticeRepository: AbstractSelfPracticeRepository {
    let localDataSource: AbstractLocalDataSource
    let remoteDataSource: AbstractRemoteDataSource
    
    init(localDataSource: AbstractLocalDataSource, remoteDataSource: AbstractRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
}
