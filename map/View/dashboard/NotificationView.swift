//
//  NotificationView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Notifications")
                .font(.largeTitle)
                .bold()
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<10) { _ in
                        HStack {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.mainSecondary)
                            Text("Notification details here")
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
    NotificationView()
}
