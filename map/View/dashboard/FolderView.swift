//
//  FolderView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct GrassShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: 15, height: 15))
        return path
    }
}

struct FolderView: View {
    let name: String
    
    var body: some View {
        VStack {
            VStack {
                Image("folder")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding()
                    .foregroundColor(.white)
                Text(name)
                    .font(.caption)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 150, height: 150)
            .background(
                GrassShape()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#2F4F4F").opacity(0.7), Color(hex: "#3B8070").opacity(0.7)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
            )
            .padding(10)
            .background(Color.black.opacity(0.2))
            .cornerRadius(15)
            .overlay(
                GrassShape()
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
        }
    }
}

// Helper extension to use hex colors
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct CanvasView3: View {
    var body: some View {
        Canvas { context, size in
            context.stroke(
                Path(ellipseIn: CGRect(origin: .zero, size: size)),
                with: .color(.main1),
                lineWidth: 4)
        }
        .frame(width: 300, height: 200)
        .border(Color.buttonHover)
    }
}


#Preview {
    FolderView(name: "New Folder")
}
