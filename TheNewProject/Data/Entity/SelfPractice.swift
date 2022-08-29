//
//  SelfPractice.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import Foundation

/* User entity of Data layer */
struct SelfPractice: Codable, Equatable {
    let avatarUrl: String?
    
    init(avatarUrl: String? = nil) {
        self.avatarUrl = avatarUrl
    }
    
    private enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
    
    static func ==(lhs: SelfPractice, rhs: SelfPractice) -> Bool {
        return lhs.avatarUrl == rhs.avatarUrl
    }
}
