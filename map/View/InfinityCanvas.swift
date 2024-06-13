//
//  InfinityCanvas.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct InfiniteCanvasView: View {
    @Bindable var viewModel = CanvasViewModel()
    @State private var newItemText = ""
    @State private var offset = CGSize.zero
    @State private var scale: CGFloat = 1.0
    @State private var lastDragPosition = CGSize.zero
    @State private var lastScaleValue: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(viewModel.currentMap?.stacks ?? []) { stack in
                    StackView(viewModel: viewModel, stack: stack)
                }
                .contentShape(Rectangle())
                .scaleEffect(scale)
                .offset(x: offset.width + lastDragPosition.width, y: offset.height + lastDragPosition.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            lastDragPosition = value.translation
                        }
                        .onEnded { value in
                            offset.width += value.translation.width
                            offset.height += value.translation.height
                            lastDragPosition = .zero
                        }
                )
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = lastScaleValue * value
                        }
                        .onEnded { value in
                            lastScaleValue = scale
                        }
                )
                .onTapGesture(count: 2) {
                    let position = Position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    if let map = viewModel.currentMap {
                        viewModel.addStack(to: map, at: position)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        TextField("New Item", text: $newItemText, onCommit: {
                            if let lastStack = viewModel.currentMap?.stacks.last {
                                viewModel.addItem(to: lastStack, text: newItemText)
                                newItemText = ""
                            }
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardShortcut(KeyEquivalent("\r"), modifiers: .command)
                    }
                }
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.loadMaps()
        }
    }
}
