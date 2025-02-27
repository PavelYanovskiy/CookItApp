//
//  highlightView.swift
//  CookItApp
//
//  Created by Павел Яновский on 21.03.2024.
//


import SwiftUI

struct highlightView: View {
    var allHighlights = ""
    
    init (highlights:[String]) {
        for index in 0 ..< highlights.count {
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct highlightView_Previews: PreviewProvider {
    static var previews: some View {
        highlightView(highlights: ["test1", "test2", "test3"])
    }
}
