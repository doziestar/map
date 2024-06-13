//
//  InfinityCanvas.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import SwiftUI

struct InfiniteCanvasView: View {
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            CanvasView()
                .scaleEffect(scale)
                .offset(offset)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            self.scale = value.magnitude
                        }
                )
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.offset = value.translation
                        }
                )
                .frame(width: geometry.size.width * 2, height: geometry.size.height * 2)
                .background(Color.white)
        }
    }
}

struct CanvasView: View {
    @State private var notes: [NoteItem] = []
    
    var body: some View {
        ZStack {
            ForEach(notes) { note in
                Text(note.textContent)
                    .position(note.position)
                    .background(Color.yellow)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if let index = self.notes.firstIndex(where: { $0.id == note.id }) {
                                    self.notes[index].position = value.location
                                }
                            }
                    )
            }
        }
        .background(Color.white)
        .onTapGesture {
            let newNote = NoteItem(
                textContent: "New Note",
                position: CGPoint(x: 100, y: 100),
                lastInteraction: Date()
            )
            self.notes.append(newNote)
        }
    }
}
