//
//  Rule.swift
//  Wordcraft
//
//  Created by Eric on 27/12/2024.
//

import Foundation

struct Rule {
    var name: String
    var predicate: (String) -> Bool
}
