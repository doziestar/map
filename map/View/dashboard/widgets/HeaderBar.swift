//
//  HeaderBar.swift
//  map
//
//  Created by Chidozie Okafor on 14/06/2024.
//

import SwiftUI

struct HeaderBar: View {
    @State private var searchText = ""
    @Binding var selectedView: String
    
    var body: some View {
        HStack {
            Text(selectedView
            )
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.teal)
                    TextField("search text across all maps", text: $searchText)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                }
                .padding(.horizontal)
                .background(Color(.darkGray).opacity(0.5))
                .cornerRadius(8)
                .padding(.trailing, 10)
                
                Text("cmd + shift + F")
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                HStack(spacing: -10) {
                    Image("dozie")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    
                    Image("dozie")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                }
            }
            .padding(.leading, 500)
        }
        .padding()
//        .background(
//            Image("darkHeaderImage")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//        )
    }
}

#Preview {
    HeaderBar(selectedView: .constant("Overiew"))
}
