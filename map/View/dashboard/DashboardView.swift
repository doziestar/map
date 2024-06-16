//
//  DashboardView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedView: String = "Overview"

    var body: some View {
        NavigationView {
            Sidebar(selectedView: $selectedView)
            VStack {
                HeaderBar(selectedView: $selectedView)
                DashboardContentArea(selectedView: $selectedView)
                    .animation(.easeInOut, value: selectedView)
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .background(
            Image("background2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        )
    }
}
#Preview {
    DashboardView()
}
