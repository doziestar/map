//
//  DashboardView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            VStack {
                HeaderView()
                DashboardContentArea()
            }
        }
    }
}
#Preview {
    DashboardView()
}
