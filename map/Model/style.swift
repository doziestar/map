//
//  style.swift
//  map
//
//  Created by Chidozie Okafor on 13/06/2024.
//

import Foundation
import SwiftData

class Style {
    var name: String?
    var borderColor: String?
    var borderWidth: CGFloat?
    var borderStyle: String?
    var fillColor: String?
    var textColor: String?
    var fontSize: CGFloat?
    var textAlignment: String?
    
    init(name: String? = nil, borderColor: String? = nil, borderWidth: CGFloat? = nil, borderStyle: String? = nil, fillColor: String? = nil, textColor: String? = nil, fontSize: CGFloat? = nil, textAlignment: String? = nil) {
        self.name = name
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.borderStyle = borderStyle
        self.fillColor = fillColor
        self.textColor = textColor
        self.fontSize = fontSize
        self.textAlignment = textAlignment
    }
}
