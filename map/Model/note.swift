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
    var position: CGPoint
    var lastInteraction: Date
    
    init(textContent: String, position: CGPoint, lastInteraction: Date) {
        self.textContent = textContent
        self.position = position
        self.lastInteraction = lastInteraction
    }
}
