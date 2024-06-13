//
//  ContentView.swift
//  map
//
//  Created by Chidozie Okafor on 12/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        InfiniteCanvasView()
            .modelContainer(for: [Stack.self, Map.self], inMemory: true)
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
