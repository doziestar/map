//
//  Item.swift
//  map
//
//  Created by Chidozie Okafor on 12/06/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
