//
//  StarredView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct StarredView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Starred Items")
                .font(.largeTitle)
                .bold()
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<5) { _ in
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Starred item details here")
                                .padding(.vertical, 5)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}


#Preview {
    StarredView()
}
