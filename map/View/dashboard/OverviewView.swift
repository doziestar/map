//
//  OverviewView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Overview")
                .font(.largeTitle)
                .bold()
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Recent Activities")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(0..<5) { _ in
                        HStack {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.green)
                            Text("Activity details here")
                                .padding(.vertical, 5)
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Quick Access")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    HStack {
                        ForEach(0..<3) { _ in
                            VStack {
                                Image(systemName: "doc.text")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Text("Quick Note")
                                    .font(.caption)
                            }
                            .frame(width: 100, height: 100)
                            .background(Color(.systemRed))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    OverviewView()
}
