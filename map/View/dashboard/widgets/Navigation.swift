//
//  Navigation.swift
//  map
//
//  Created by Chidozie Okafor on 14/06/2024.
//

import SwiftUI

struct QuickNavigationView: View {
    @Binding var selectedView: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Navigation")
                .foregroundColor(.gray)
                .font(.caption)
                .padding(.horizontal)
            
            SidebarItem(icon: "square.grid.2x2", title: "Overview", isSelected: selectedView == "Overview") {
                withAnimation {
                    selectedView = "Overview"
                }
            }
            SidebarItem(icon: "bell", title: "Notifications", isSelected: selectedView == "Notifications") {
                withAnimation {
                    selectedView = "Notifications"
                }
            }
            SidebarItem(icon: "gear", title: "Settings", isSelected: selectedView == "Settings") {
                withAnimation {
                    selectedView = "Settings"
                }
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    QuickNavigationView(selectedView: .constant("Overview"))
}
