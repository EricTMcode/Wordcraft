//
//  ContentView.swift
//  Wordcraft
//
//  Created by Eric on 26/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<viewModel.columns.count, id: \.self) { i in
                VStack(spacing: 2) {
                    let column = viewModel.columns[i]
                    
                    ForEach(column) { tile in
                        Button {
                            // select this letter
                        } label: {
                            Text(tile.letter)
                                .font(.largeTitle.weight(.bold))
                                .fontDesign(.rounded)
                                .frame(width: 120, height: 50)
                                .foregroundStyle(.white)
                                .background(.blue.gradient)
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
