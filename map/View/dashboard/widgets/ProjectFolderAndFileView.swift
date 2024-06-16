//
//  ProjectFolderAndFileView.swift
//  map
//
//  Created by Chidozie Okafor on 14/06/2024.
//

import SwiftUI
import SwiftData

struct ProjectFolderAndFileView: View {
    @Binding var isGridView: Bool
    @Binding var currentPath: [Folder]
    var folders: [Folder]
    @Environment(\.modelContext) private var context

    var body: some View {
        if folders.isEmpty {
            VStack {
                Spacer()
                ContentUnavailableView {
                    Label("No Folders", systemImage: "folder")
                } description: {
                    Text("You don't have any folders yet.")
                } actions: {
                    AnimatedButtonView(title: "+ Folder") { input in
                        addFolder(name: input)
                    }
                    .padding()
                }
                Spacer()
            }
        } else {
            ScrollView {
                if isGridView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                        ForEach(folders) { folder in
                            Button(action: {
                                currentPath.append(folder)
                                printDebugInfo()
                            }) {
                                FolderView(name: folder.name)
                            }
                        }
                    }
                    .padding()
                } else {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(folders) { folder in
                            Button(action: {
                                currentPath.append(folder)
                                printDebugInfo()
                            }) {
                                HStack {
                                    Image(systemName: "folder")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)
                                    Text(folder.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.8))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }

    private func addFolder(name: String) {
        guard !name.isEmpty else { return }
        
        if let parentFolder = currentPath.last {
            let newFolder = Folder(name: name, parentFolder: parentFolder)
            parentFolder.subfolders.append(newFolder)
            context.insert(newFolder)
        } else {
            let newFolder = Folder(name: name)
            context.insert(newFolder)
        }
        printDebugInfo()
    }

    private func printDebugInfo() {
        print("Current Path: \(currentPath.map { $0.name })")
        print("Folders in Current View: \(folders.map { $0.name })")
    }
}

#Preview {
    ProjectFolderAndFileView(isGridView: .constant(true), currentPath: .constant([]), folders: [])
}










