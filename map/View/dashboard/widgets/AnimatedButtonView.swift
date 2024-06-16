import SwiftUI

struct AnimatedButtonView: View {
    let title: String
    let action: (String) -> Void
    
    @State private var showTextField = false
    @State private var textFieldValue = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            if !showTextField {
                Button(action: {
                    withAnimation {
                        showTextField.toggle()
                        isTextFieldFocused = true
                    }
                }) {
                    Text(title)
                        .foregroundColor(.buttonHover)
                        .padding()
                        .background(Color.folderDarkGray)
                        .cornerRadius(8)
                        .transition(.opacity)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            if showTextField {
                HStack {
                    TextField("Enter \(title)", text: $textFieldValue, onCommit: {
                        action(textFieldValue)
                        DispatchQueue.main.async {
                            textFieldValue = ""
                            isTextFieldFocused = false
                            withAnimation {
                                showTextField = false
                            }
                        }
                    })
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding()
                    .background(Color.folderDarkGray.opacity(0.8))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .accentColor(.buttonHover)
                    .frame(maxWidth: 200)
                    .focused($isTextFieldFocused)
                    .transition(.move(edge: .leading).combined(with: .opacity))
                    
                    Button(action: {
                        action(textFieldValue)
                        textFieldValue = ""
                        isTextFieldFocused = false
                        withAnimation {
                            showTextField = false
                        }
                    }) {
                        Text("Continue")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.folderDarkGray.opacity(0.8))
                            .cornerRadius(8)
                            .transition(.opacity)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .transition(.move(edge: .leading).combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: showTextField)
    }
}

#Preview {
    AnimatedButtonView(title: "+ Map") { input in
        print("Map action with input: \(input)")
    }
}
