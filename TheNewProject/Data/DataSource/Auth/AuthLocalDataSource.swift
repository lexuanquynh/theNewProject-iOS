//
//  AuthLocalDataSource.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/25/22.
//

import Foundation
import RxSwift

class AuthLocalDataSource: AbstractAuthLocalDataSource {
    let dbClient: AbstractDatabaseClient
    
    init(dbClient: AbstractDatabaseClient) {
        self.dbClient = dbClient
    }
}
