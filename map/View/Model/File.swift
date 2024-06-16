//
//  File.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//
import SwiftData
import Foundation

// Define File model
@Model class File: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var content: String
    var parentFolder: Folder

    init(id: UUID = UUID(), name: String, content: String, parentFolder: Folder) {
        self.id = id
        self.name = name
        self.content = content
        self.parentFolder = parentFolder
    }
}
