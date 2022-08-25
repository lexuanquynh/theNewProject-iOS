//
//  AuthRepository.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation
import RxSwift

/* This is auth repository class implementation from AbstractAuthRepository. Which will be used to get user auth related data from api client/server response*/
class AuthRepository: AbstractAuthRepository {
    let localDataSource: AbstractLocalDataSource
    let remoteDataSource: AbstractRemoteDataSource
    
    init(localDataSource: AbstractLocalDataSource, remoteDataSource: AbstractRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
}
