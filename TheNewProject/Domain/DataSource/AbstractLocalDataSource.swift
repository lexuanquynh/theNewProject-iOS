//
//  AbstractLocalDataSource.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation

/* This base local datasource of all local datasource will be used in this project. It will have a base databse client to get data from local databse. */
protocol AbstractLocalDataSource: AnyObject {
    var dbClient: AbstractDatabaseClient {get}
}
