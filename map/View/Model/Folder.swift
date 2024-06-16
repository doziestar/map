//
//  Folder.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//

import SwiftData
import Foundation

@Model class Folder: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var subfolders: [Folder] = []
    var files: [File] = []

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
