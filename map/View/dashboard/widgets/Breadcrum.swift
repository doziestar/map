//
//  Breadcrum.swift
//  map
//
//  Created by Chidozie Okafor on 14/06/2024.
//

import SwiftUI

struct BreadcrumbNavigation: View {
    @Binding var currentPath: [Folder]

    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    currentPath.removeAll()
                }
            }) {
                HStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.folderSlateBlue)
                    Text("Home")
                        .foregroundColor(.folderDarkGreen)
                }
            }
            .buttonStyle(PlainButtonStyle())

            ForEach(Array(currentPath.enumerated()), id: \.element) { index, folder in
                HStack {
                    Text(">")
                        .foregroundColor(.gray)
                    Button(action: {
                        withAnimation {
                            currentPath = Array(currentPath.prefix(index + 1))
                        }
                    }) {
                        Text(folder.name)
                            .foregroundColor(colorForIndex(index))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding()
    }

    private func colorForIndex(_ index: Int) -> Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink]
        return colors[index % colors.count]
    }
}



#Preview {
    BreadcrumbNavigation(currentPath: .constant([Folder(name: "new")]))
}
