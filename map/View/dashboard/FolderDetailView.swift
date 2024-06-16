//
//  FolderDetailView.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//

import SwiftUI
import SwiftData

struct FolderDetailView: View {
    @State var folder: Folder
    @Binding var currentPath: [Folder]
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack {
            ProjectFolderAndFileView(
                isGridView: .constant(true),
                currentPath: $currentPath,
                folders: folder.subfolders
            )
            .navigationTitle(folder.name)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    AnimatedButtonView(title: "+ Folder") { input in
                        addSubfolder(name: input)
                    }
                }
            }
            .onAppear {
                printDebugInfo()
            }
        }
    }

    func addSubfolder(name: String) {
        guard !name.isEmpty else {
            print("Subfolder name cannot be empty.")
            return
        }
        
        let newFolder = Folder(name: name, parentFolder: folder)
        folder.subfolders.append(newFolder)
        context.insert(newFolder)
        printDebugInfo()
    }

    private func printDebugInfo() {
        print("Current Path: \(currentPath.map { $0.name })")
        print("Folder: \(folder.name)")
        print("Subfolders: \(folder.subfolders.map { $0.name })")
    }
}

#Preview {
    FolderDetailView(folder: Folder(name: "Sample"), currentPath: .constant([]))
}

