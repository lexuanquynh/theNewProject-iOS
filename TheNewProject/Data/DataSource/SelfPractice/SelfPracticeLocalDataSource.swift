//
//  SelfPracticeLocalDataSource.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import Foundation
import RxSwift

class SelfPracticeLocalDataSource: AbstractSelfPracticeLocalDataSource {
    let dbClient: AbstractDatabaseClient
    
    init(dbClient: AbstractDatabaseClient) {
        self.dbClient = dbClient
    }
}
