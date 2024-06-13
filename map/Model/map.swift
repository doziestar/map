//
//  map.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftData
import SwiftUI



@Model
class Map: Identifiable {
    var id: UUID = UUID()
    var name: String
    var lastInteraction: Date
    var canvasTransform: String
    var stacks: [Stack] = []
//    var areas: [Area]? = nil
//    var connections: [Connection]? = nil
    
    init(name: String, lastInteraction: Date, canvasTransform: String) {
        self.name = name
        self.lastInteraction = lastInteraction
        self.canvasTransform = canvasTransform
    }
}
