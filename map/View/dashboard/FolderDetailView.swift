//
//  FolderDetailView.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//

import SwiftUI

struct FolderDetailView: View {
    @State var folder: Folder
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack(spacing: 10) {
                    AnimatedButtonView(title: "+ Map") { input in
                        print("Map added")
                    }

                    AnimatedButtonView(title: "+ Folder") { input in
                        addSubfolder(name: input)
                    }
                }
                .padding(.trailing, 20)
            }
            List {
                Section(header: Text("Subfolders")) {
                    ForEach(folder.subfolders) { subfolder in
                        NavigationLink(destination: FolderDetailView(folder: subfolder)) {
                            Text(subfolder.name)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteSubfolder(subfolder)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }

                Section(header: Text("Files")) {
                    ForEach(folder.files) { file in
                        NavigationLink(destination: FileDetailView(file: file)) {
                            Text(file.name)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteFile(file)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .navigationTitle(folder.name)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: editFolderName) {
                        Text("Edit")
                    }
                }
            }
        }
    }

    private func addSubfolder(name: String) {
        let newSubfolder = Folder(name: name)
        folder.subfolders.append(newSubfolder)
        context.insert(newSubfolder)
    }

    private func deleteSubfolder(_ subfolder: Folder) {
        if let index = folder.subfolders.firstIndex(where: { $0.id == subfolder.id }) {
            folder.subfolders.remove(at: index)
            context.delete(subfolder)
        }
    }

    private func deleteFile(_ file: File) {
        if let index = folder.files.firstIndex(where: { $0.id == file.id }) {
            folder.files.remove(at: index)
            context.delete(file)
        }
    }

    private func editFolderName() {
        // Implement edit functionality
    }
}

#Preview {
    FolderDetailView(folder: Folder(name: "Example Folder"))
}
