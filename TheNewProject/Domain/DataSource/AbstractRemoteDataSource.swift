//
//  AbstractRemoteDataSource.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation

/* This base remote datasource of all remote datasource will be used in this project. It will have a base api client to get data from server. */
protocol AbstractRemoteDataSource: AnyObject {
    var apiClient: AbstractApiClient {get}
}
