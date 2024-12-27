//
//  ViewModel.swift
//  Wordcraft
//
//  Created by Eric on 26/12/2024.
//

import SwiftUI

@Observable
class ViewModel {
    var columns = [[Tile]]()
    private var selected = [Tile]()
    private var usedWords = Set<String>()

    let dictionary: Set<String> = {
        guard let url = Bundle.main.url(forResource: "dictionary", withExtension: "txt") else {
            fatalError("Couldn't locate dictionary.txt")
        }

        guard let contents = try? String(contentsOf: url, encoding: .utf8) else {
            fatalError("Couldn't load dictionary.txt")
        }

        return Set(contents.components(separatedBy: .newlines))
    }()

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
            checkWord()
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

    func background(for tile: Tile) -> Color {
        if selected.contains(tile) {
            .white
        } else {
            .blue
        }
    }

    func forground(for tile: Tile) -> Color {
        if selected.contains(tile) {
            .black
        } else {
            .white
        }
    }

    func remove(_ tile: Tile) {
        guard let position = columns[tile.column].firstIndex(of: tile) else { return }

        withAnimation {
            columns[tile.column].remove(at: position)
            columns[tile.column].insert(Tile(column: tile.column), at: 0)
        }
    }

    func checkWord() {
        let word = selected.map(\.letter).joined()

        guard usedWords.contains(word) == false else { return }
        guard dictionary.contains(word.lowercased()) else { return }

        for tile in selected {
            remove(tile)
        }

        selected.removeAll()
        usedWords.insert(word)
    }
}
