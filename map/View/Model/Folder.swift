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
    
    @Relationship(deleteRule: .cascade, inverse: \File.parentFolder)
    var files: [File] = []
    var parentFolder: Folder?

    init(id: UUID = UUID(), name: String, parentFolder: Folder? = nil) {
        self.id = id
        self.name = name
        self.parentFolder = parentFolder
    }
}
