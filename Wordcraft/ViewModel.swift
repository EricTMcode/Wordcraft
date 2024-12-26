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
    private var selected = [Tile]()

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

    func select(_ tile: Tile) {
        if selected.last == tile && selected.count > 3 {
            // check their word
        } else if let index = selected.firstIndex(of: tile) {
            if selected.count == 1 {
                selected.removeLast()
            } else {
                selected.removeLast(selected.count - index - 1)
            }
        } else {
            selected.append(tile)
        }
    }
}
