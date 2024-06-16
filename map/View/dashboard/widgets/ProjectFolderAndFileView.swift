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
    @Environment(\.modelContext) private var context

    var currentFolder: Folder? {
        currentPath.last
    }

    var body: some View {
        if (currentFolder?.subfolders.isEmpty ?? true) {
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
                        ForEach(currentFolder?.subfolders ?? []) { folder in
                            FolderView(name: folder.name)
                                .onTapGesture {
                                    currentPath.append(folder)
                                }
                        }
                    }
                    .padding()
                } else {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(currentFolder?.subfolders ?? []) { folder in
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
                            .onTapGesture {
                                currentPath.append(folder)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }

    private func addFolder(name: String) {
        let newFolder = Folder(name: name)
        if let currentFolder = currentPath.last {
            currentFolder.subfolders.append(newFolder)
        } else {
            context.insert(newFolder)
        }
    }
}

#Preview {
    ProjectFolderAndFileView(isGridView: .constant(true), currentPath: .constant([]))
}


