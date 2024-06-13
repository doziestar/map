//
//  StackView.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI
import UniformTypeIdentifiers


struct StackView: View {
    @Bindable var viewModel: CanvasViewModel
    var stack: Stack
    
    var body: some View {
        VStack {
            ForEach(stack.items) { item in
                Text(item.textContent)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(5)
                    .onDrag {
                        return NSItemProvider(object: item.id.uuidString as NSString)
                    }
            }
            .onDrop(of: [UTType.text], delegate: StackDropDelegate(viewModel: viewModel, stack: stack))
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
        .position(CGPoint(x: stack.position.x, y: stack.position.y))
    }
}

struct StackDropDelegate: DropDelegate {
    var viewModel: CanvasViewModel
    var stack: Stack
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
}

//#Preview {
//    StackView()
//}
