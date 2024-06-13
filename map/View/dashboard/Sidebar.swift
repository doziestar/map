//
//  Sidebar.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        List {
            Section(header: Text("Navigation")) {
                NavigationLink(destination: OverviewView()) {
                    Label("Overview", systemImage: "house")
                }
                NavigationLink(destination: NotificationView()) {
                    Label("Notifications", systemImage: "bell")
                }
                NavigationLink(destination: SettingsView()) {
                    Label("Settings", systemImage: "gear")
                }
            }
            
            Section(header: Text("Quick Access")) {
                NavigationLink(destination: StarredView()) {
                    Label("Starred", systemImage: "star")
                }
            }
            
            Section(header: Text("Search")) {
                HStack {
                    TextField("Search Folders", text: .constant(""))
                    Button(action: {
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

#Preview {
    Sidebar()
}
