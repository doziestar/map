//
//  stack.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftData
import SwiftUI

@Model
class Stack: Identifiable {
    var id: UUID = UUID()
    var items: [NoteItem] = []
    var position: Position
    var lastInteraction: Date
    var style: Style?
    
    init(id: UUID, items: [NoteItem], position: Position, lastInteraction: Date, style: Style? = nil) {
        self.id = id
        self.items = items
        self.position = position
        self.lastInteraction = lastInteraction
        self.style = style
    }
  
}
