//
//  FileDetailView.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//

import SwiftUI
import SwiftData

struct FileDetailView: View {
    @State var file: File
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack {
            TextField("File Name", text: $file.name)
                .padding()
                .background(Color(.folderDarkGray))
                .cornerRadius(8)
                .padding(.horizontal)

            TextEditor(text: $file.content)
                .padding()
                .background(Color(.folderDarkGray))
                .cornerRadius(8)
                .padding(.horizontal)
        }
        .navigationTitle(file.name)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: saveFile) {
                    Text("Save")
                }
            }
        }
    }

    private func saveFile() {
        // Save the file (SwiftData handles this automatically on change)
//        context.saveIfNeeded()
    }
}

#Preview {
    FileDetailView(file: File(name: "Example File", content: "", parentFolder: Folder(name: "Example Folder")))
}
