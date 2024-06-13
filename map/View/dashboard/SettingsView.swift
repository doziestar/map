//
//  SettingsView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .font(.largeTitle)
                .bold()
                .padding()

            Form {
                Section(header: Text("Account")) {
                    TextField("Username", text: .constant(""))
                    SecureField("Password", text: .constant(""))
                    Button("Save Changes") {
                        // Handle save changes
                    }
                }
                
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: .constant(true))
                    Toggle("Dark Mode", isOn: .constant(false))
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    SettingsView()
}
