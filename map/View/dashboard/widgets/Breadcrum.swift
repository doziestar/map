//
//  Breadcrum.swift
//  map
//
//  Created by Chidozie Okafor on 14/06/2024.
//

import SwiftUI

//struct BreadcrumbNavigation: View {
//    var body: some View {
//        HStack {
//            Text("Projects")
//                .foregroundColor(.white)
//            Image(systemName: "chevron.right")
//                .foregroundColor(.white)
//            Text("Video Projects")
//                .foregroundColor(.white)
//            
//            Spacer()
//        }
//        .padding(.horizontal)
//        .padding(.top, 10)
//    }
//}

struct BreadcrumbNavigation: View {
    @Binding var currentPath: [Folder]

    var body: some View {
        HStack {
            ForEach(Array(currentPath.enumerated()), id: \.element) { index, folder in
                HStack {
                    if index > 0 {
                        Text(">")
                    }
                    Button(action: {
                        currentPath = Array(currentPath.prefix(index + 1))
                    }) {
                        Text(folder.name)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .padding()
    }
}


#Preview {
    BreadcrumbNavigation(currentPath: .constant([Folder(name: "new")]))
}
