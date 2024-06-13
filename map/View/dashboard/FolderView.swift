//
//  FolderView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct FolderView: View {
    let name: String
    
    var body: some View {
        VStack {
            Image(systemName: "folder.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            Text(name)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100, height: 100)
        .background(Color(.blue))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
#Preview {
    FolderView(name: "New Folder")
}
