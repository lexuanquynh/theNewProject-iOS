//
//  AbstractUsecase.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation

/* This base usecase of all usecase will be used in this project. It will have a base repository to get data from api client. */
protocol AbstractUsecase: AnyObject {
    var repository: AbstractRepository {get}
}
