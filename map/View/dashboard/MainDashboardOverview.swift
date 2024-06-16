//
//  MainDashboardOverview.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//

import SwiftUI

struct MainDashboardOverview: View {
    @State private var isGridView = true
    @State private var currentPath: [Folder] = []
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack {
            BreadcrumbNavigation(currentPath: $currentPath)
            HStack {
                Spacer()
                HStack(spacing: 10) {
                    AnimatedButtonView(title: "+ Map") { input in
                        print("Map added")
                    }

                    AnimatedButtonView(title: "+ Folder") { input in
                        addFolder(name: input)
                    }

                    Button(action: {
                        isGridView.toggle()
                    }) {
                        Image(systemName: isGridView ? "square.grid.2x2" : "list.bullet")
                            .foregroundColor(.buttonHover)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.trailing, 20)
            }
            ProjectFolderAndFileView(isGridView: $isGridView, currentPath: $currentPath)
        }
    }

    private func addFolder(name: String) {
        guard !name.isEmpty else { return }
        let newFolder = Folder(name: name)
        if let currentFolder = currentPath.last {
            currentFolder.subfolders.append(newFolder)
        } else {
            context.insert(newFolder)
        }
    }
}

#Preview {
    MainDashboardOverview()
}

