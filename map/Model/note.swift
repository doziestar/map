//
//  note.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftData
import SwiftUI

@Model
class NoteItem: Identifiable {
    var id: UUID = UUID()
    var textContent: String
    var position: Position
    var lastInteraction: Date
    var style: Style?
    
    init(textContent: String, position: Position, lastInteraction: Date, style: Style? = nil) {
        self.textContent = textContent
        self.position = position
        self.lastInteraction = lastInteraction
        self.style = style
    }
}
