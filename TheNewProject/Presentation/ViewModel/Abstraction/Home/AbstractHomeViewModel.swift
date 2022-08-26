//
//  AbstractHomeViewModel.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/26/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

/* This is AbstractAUthViewModel abstraction extented from AbstractViewModel. Which will be used to get user auth related data by its usecases*/
protocol AbstractHomeViewModel: AbstractViewModel {
    associatedtype AuthInput
    associatedtype AuthOutput
    
    var disposeBag: DisposeBag {get}
}
