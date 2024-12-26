//
//  ViewModel.swift
//  Wordcraft
//
//  Created by Eric on 26/12/2024.
//

import Foundation

@Observable
class ViewModel {
    var columns = [[Tile]]()

    init() {
        for i in 0..<5 {
            var column = [Tile]()

            for _ in 0..<8 {
                let piece = Tile(column: i)
                column.append(piece)
            }

            columns.append(column)
        }
    }
}
