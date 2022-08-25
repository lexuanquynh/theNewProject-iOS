//
//  AbstractAuthViewModel.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import Foundation
import RxSwift
import RxRelay

/* This is AbstractAUthViewModel abstraction extented from AbstractViewModel. Which will be used to get user auth related data by its usecases*/
protocol AbstractAuthViewModel: AbstractViewModel {
    associatedtype AuthInput
    associatedtype AuthOutput
    
    var disposeBag: DisposeBag {get}
}
