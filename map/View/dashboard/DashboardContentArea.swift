//
//  DashboardContentArea.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct DashboardContentArea: View {
        @Binding var selectedView: String
    
    var body: some View {
                VStack {
                        switch selectedView {
                        case "Overview":
                            MainDashboardOverview()
                                .transition(.opacity)
                        case "Notifications":
                            NotificationView()
                                .transition(.opacity)
                        case "Settings":
                            SettingsView()
                                .transition(.opacity)
                        default:
                            Text("Select a view")
                                .transition(.opacity)
                        }
                    }
                    .animation(.easeInOut, value: selectedView)
                
            
        }
    
}

#Preview {
    DashboardContentArea(selectedView: .constant("Overview"))
}
