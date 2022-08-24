//
//  AbstractViewModel.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation

/* This base viewmodel of all viewmodel will be used in this project. It will have a base usecase to get data from repository. */
protocol AbstractViewModel: AnyObject {
    var usecase: AbstractUsecase {get}
}
