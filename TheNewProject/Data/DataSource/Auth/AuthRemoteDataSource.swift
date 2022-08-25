//
//  AuthRemoteDataSource.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/25/22.
//

import Foundation
import RxSwift

class AuthRemoteDataSource: AbstractAuthRemoteDataSource {
    let apiClient: AbstractApiClient
    
    init(apiClient: AbstractApiClient) {
        self.apiClient = apiClient
    }
}
