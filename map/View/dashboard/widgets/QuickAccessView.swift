//
//  QuickAccessView.swift
//  map
//
//  Created by Chidozie Okafor on 14/06/2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct QuickAccessView: View {
    @State private var expandedItems: Set<String> = []
    @State private var items: [QuickAccessItemModel] = [
        QuickAccessItemModel(icon: "star.fill", title: "Starred", color: .yellow),
        QuickAccessItemModel(icon: "crown", title: "Good Boy", color: .brown),
        QuickAccessItemModel(icon: "bolt.heart", title: "Health", color: .blue),
        QuickAccessItemModel(icon: "book.pages", title: "Tasks", color: .purple)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Quick Access")
                .foregroundColor(.gray)
                .font(.caption)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(items) { item in
                    QuickAccessItem(
                        icon: item.icon,
                        title: item.title,
                        color: item.color,
                        expandedItems: $expandedItems
                    )
                    .onDrag {
                        NSItemProvider(object: item.id as NSString)
                    }
                    .onDrop(of: [UTType.text], delegate: DropViewDelegate(item: item, items: $items, current: item.id))
                }
            }
            .padding()
            .modifier(GlassmorphicBackground())
            
            // Command Shortcut
            HStack {
                Text("cmd + shift + Q")
                    .font(.system(size: 8, weight: .medium, design: .monospaced))
                    .padding(3)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(4)
               
            }
            .foregroundColor(.white)
            .padding(4)
            .background(Color.black.opacity(0.8))
            .cornerRadius(4)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.bottom, 20)
    }
}

struct DropViewDelegate: DropDelegate {
    let item: QuickAccessItemModel
    @Binding var items: [QuickAccessItemModel]
    let current: String

    func dropEntered(info: DropInfo) {
        guard let fromIndex = items.firstIndex(where: { $0.id == current }),
              let toIndex = items.firstIndex(where: { $0.id == item.id }),
              fromIndex != toIndex else { return }
        items.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
    }

    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}

struct QuickAccessItemModel: Identifiable {
    let id = UUID().uuidString
    let icon: String
    let title: String
    let color: Color
}

struct QuickAccessItem: View {
    let icon: String
    let title: String
    let color: Color
    @Binding var expandedItems: Set<String>

    var isExpanded: Bool {
        expandedItems.contains(title)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    if isExpanded {
                        expandedItems.remove(title)
                    } else {
                        expandedItems.insert(title)
                    }
                }
            }) {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(color)
                    Text(title)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(.gray)
                        .imageScale(.small)
                }
                .padding(.horizontal)
            }
            .buttonStyle(PlainButtonStyle())
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 5) {
                    SubFolderItem(title: "Subfolder 1", expandedItems: $expandedItems)
                    SubItem(title: "Subfile 1", icon: "doc", isFolder: false, expandedItems: $expandedItems)
                    SubFolderItem(title: "Subfolder 2", expandedItems: $expandedItems)
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct SubFolderItem: View {
    let title: String
    @Binding var expandedItems: Set<String>

    var isExpanded: Bool {
        expandedItems.contains(title)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    if isExpanded {
                        expandedItems.remove(title)
                    } else {
                        expandedItems.insert(title)
                    }
                }
            }) {
                HStack {
                    Image(systemName: "folder")
                        .foregroundColor(.yellow)
                    Text(title)
                        .foregroundColor(.white)
                        .font(.footnote)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(.gray)
                        .imageScale(.small)
                }
                .padding(.horizontal)
                .padding(.leading, 10)
            }
            .buttonStyle(PlainButtonStyle())

            if isExpanded {
                VStack(alignment: .leading, spacing: 5) {
                    SubItem(title: "\(title) - Subfile 1", icon: "doc", isFolder: false, expandedItems: $expandedItems)
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct SubItem: View {
    let title: String
    let icon: String
    let isFolder: Bool
    @Binding var expandedItems: Set<String>

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isFolder ? .yellow : .blue)
            Text(title)
                .foregroundColor(.white)
                .font(.footnote)
                .lineLimit(1)
                .truncationMode(.tail)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.leading, 10)
    }
}

#Preview {
    QuickAccessView()
}
