//
//  HeaderView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Projects > Video Projects")
                .font(.headline)
            Spacer()
            TextField("Search text across all maps", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 300)
            HStack(spacing: -10) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.leading)
        }
        .padding()
    }
}


#Preview {
    HeaderView()
}
