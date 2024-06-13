//
//  canvas.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI
import Combine
import SwiftData

@Observable
class CanvasViewModel {
    var maps: [Map] = []
    var currentMap: Map?
    
    func loadMaps() {
    }
    
    func saveMaps() {
    }
    
    func addStack(to map: Map, at position: Position) {
        let newStack = Stack(id: UUID(), items: [], position: position, lastInteraction: Date())
        if let index = maps.firstIndex(where: { $0.id == map.id }) {
            maps[index].stacks.append(newStack)
            saveMaps()
        }
    }
    
    func addItem(to stack: Stack, text: String) {
        let newItem = NoteItem(textContent: text, position: Position(x: 0, y: 0), lastInteraction: Date())
        if let mapIndex = maps.firstIndex(where: { $0.id == currentMap?.id }) {
            if let stackIndex = maps[mapIndex].stacks.firstIndex(where: { $0.id == stack.id }) {
                maps[mapIndex].stacks[stackIndex].items.append(newItem)
                saveMaps()
            }
        }
    }
    
    func moveItem(_ item: NoteItem, from oldStack: Stack, to newStack: Stack) {
    }
}
