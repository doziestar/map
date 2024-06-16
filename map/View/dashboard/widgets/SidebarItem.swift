//
//  SidebarItem.swift
//  map
//
//  Created by Chidozie Okafor on 16/06/2024.
//

import SwiftUI

struct SidebarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    @State private var isHovered = false
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(isSelected ? .button : .white)
                Text(title)
                    .foregroundColor(isSelected ? .button : .white)
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(isSelected ? Color.secondaryText.opacity(0.2) : (isHovered ? Color.secondaryText
                .opacity(0.1) : Color.clear))
            .cornerRadius(8)
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            withAnimation {
                isHovered = hovering
            }
        }
    }
}

#Preview {
//    SidebarItem()
}
