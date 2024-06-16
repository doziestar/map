//
//  CustomSearchBar.swift
//  map
//
//  Created by Chidozie Okafor on 14/06/2024.
//

import SwiftUI

struct GlassmorphicSearchBar: View {
    var body: some View {
        ZStack {
            // Background gradient
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.main1.opacity(0.9), Color.button]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 60)
            
            // Glassmorphic effect layer
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.2))
                .background(
                    Color.white
                        .opacity(0.1)
                        .blur(radius: 10)
                )
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.button.opacity(0.3), lineWidth: 1)
                )
            
            HStack {
                // Search Icon and Text
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                        Text("search Folders")
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, 15)
                
                Spacer()
                
                // Command Shortcut
                VStack {
                    Text("cmd + shift + O")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.black.opacity(0.6))
                        )
                        .padding(.trailing, 15)
                }
            }
        }
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}

#Preview {
    GlassmorphicSearchBar()
}
