//
//  DashboardContentArea.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct DashboardContentArea: View {
    let folders = ["The Experiment - Script Arrangement", "The Experiment - Assets", "Atlanta", "Older Video Projects", "Home Videos"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Projects > Video Projects")
                        .font(.headline)
                    Spacer()
                    TextField("Search text across all maps", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 300)
                }
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(folders, id: \.self) { folder in
                            FolderView(name: folder)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Video Projects")
        }
    }
}
#Preview {
    DashboardContentArea()
}
