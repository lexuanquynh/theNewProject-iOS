//
//  SelfPracticeRemoteDataSource.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import Foundation
import RxSwift

class SelfPracticeRemoteDataSource: AbstractSelfPracticeRemoteDataSource {
    let apiClient: AbstractApiClient
    
    init(apiClient: AbstractApiClient) {
        self.apiClient = apiClient
    }
}
