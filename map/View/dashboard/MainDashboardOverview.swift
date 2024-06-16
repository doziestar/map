//
//  MainDashboardOverview.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//

import SwiftUI
import SwiftData

struct MainDashboardOverview: View {
    @State private var isGridView = true
    @State private var currentPath: [Folder] = []
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<Folder> { $0.parentFolder == nil }) var rootFolders: [Folder]

    var body: some View {
        #if os(macOS)
        // MacOS view
        VStack {
            headerView
            if currentPath.isEmpty {
                ProjectFolderAndFileView(isGridView: $isGridView, currentPath: $currentPath, folders: rootFolders)
            } else {
                FolderDetailView(folder: currentPath.last!, currentPath: $currentPath)
            }
        }
        .navigationTitle("Overview")
        #else
        // iOS view
        NavigationView {
            VStack {
                headerView
                if currentPath.isEmpty {
                    ProjectFolderAndFileView(isGridView: $isGridView, currentPath: $currentPath, folders: rootFolders)
                } else {
                    FolderDetailView(folder: currentPath.last!, currentPath: $currentPath)
                }
            }
            .navigationTitle("Overview")
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use StackNavigationViewStyle for iOS
        #endif
    }

    var headerView: some View {
        HStack {
            BreadcrumbNavigation(currentPath: $currentPath)
            Spacer()
            HStack(spacing: 10) {
                AnimatedButtonView(title: "+ Map") { input in
                    print("Map added")
                }

                AnimatedButtonView(title: "+ Folder") { input in
                    withAnimation {
                        addRootFolder(name: input)
                    }
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
    }
    
    private func addRootFolder(name: String) {
        guard !name.isEmpty else { return }
        
        if let parentFolder = currentPath.last {
            let newFolder = Folder(name: name, parentFolder: parentFolder)
            parentFolder.subfolders.append(newFolder)
            context.insert(newFolder)
        } else {
            let newFolder = Folder(name: name)
            context.insert(newFolder)
        }
    }
}

#Preview {
    MainDashboardOverview()
}




