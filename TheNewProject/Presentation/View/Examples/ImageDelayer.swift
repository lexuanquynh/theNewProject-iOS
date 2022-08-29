//
//  ImageDelayer.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import UIKit

final class ImageDelayer {
    
    private let group = DispatchGroup()
    private let queue = DispatchQueue(label: "delayer", attributes: .concurrent)
    
    func getDelayedImage() -> UIImage {
        let timeout: TimeInterval = Double(arc4random_uniform(11)) / 300
        
        group.enter()
        
        queue.asyncAfter(deadline: .now() + timeout) {
            self.group.leave()
        }
        
        _ = group.wait(timeout: .distantFuture)
        
        return UIImage(named: "auth")!
    }
}
