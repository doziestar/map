//
//  Sidebar.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI


struct Sidebar: View {
    @State private var isQuickAccessCollapsed = false
    @Binding var selectedView: String
    
    var body: some View {
        VStack(alignment: .leading) {
            // Logo
            Image("logo")
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
                .frame(maxWidth: .infinity)
                            
            Spacer()
            // Navigation Section
            QuickNavigationView(selectedView: $selectedView)
                .frame(maxWidth: .infinity)
                .padding(.leading)
            
            // Quick Access Section
            QuickAccessView()
                .frame(maxWidth: .infinity)
            
            // Search Section
            GlassmorphicSearchBar()
                .frame(maxWidth: .infinity)
            
            
            Spacer()
            
            // Logout Button
            SidebarItem(icon: "arrowshape.turn.up.left", title: "Log Out", isSelected: false) {
                        }
            .padding(.bottom)
            .frame(maxWidth: .infinity)
        }
        .background(
            Image("darkHeaderImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
//        .frame(maxWidth: 250)
    }
}


#Preview {
    Sidebar(selectedView: .constant("Overview"))
}
