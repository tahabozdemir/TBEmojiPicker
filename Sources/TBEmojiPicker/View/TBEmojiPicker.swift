//
//  TBEmojiPicker.swift
//  TBEmojiPicker
//  
//  Created by Taha Bozdemir on 29.04.2023.
//

import SwiftUI

public struct TBEmojiPicker : View {
    @Binding var selectedEmoji: String
    @State private var searchQuery: String = ""
    private var emojis: [Emoji] = EmojiItem.shared.emojiAll
    
    var selectedColor: Color
    var columnCount: Int
    var bottomNavBar: BottomNavBar
    
    /// Only one required parameter is the binding to selectedEmoji. All other parameters have default values
    /// - Parameters:
    ///   - selectedEmoji: A binding to the selected emoji variable
    ///   - selectedColor: Color of the border of the selected emoji
    ///   - columnCount: Count of grid column
    ///   - bottomNavBar: BottomNavBar(backgroundColor: , foregroundColor: )
    ///
    ///   Parameters BottomNavbar :
    ///   - backgroundColor: Background color of bottom navigation bar
    ///   - foregroundColor: Foreground color of bottom navigation symbols
    ///
    public init(selectedEmoji: Binding<String>, selectedColor: Color = .blue, columnCount: Int = 5, bottomNavBar: BottomNavBar = BottomNavBar(backgroundColor: .black, foregroundColor: .white)) {
        self._selectedEmoji = selectedEmoji
        self.selectedColor = selectedColor
        self.columnCount = columnCount
        self.bottomNavBar = bottomNavBar
    }
    
    private var searchResult: [Emoji] {
        guard !searchQuery.isEmpty else {return emojis}
        let lowercasedSearchQuery = searchQuery.lowercased()
        return emojis.filter {$0.description.contains(lowercasedSearchQuery)}
        
    }
    
    private func getEmojiByCategory(for category: CategoryType) -> [Emoji] {
        return searchResult.filter { $0.category == category.rawValue}
    }
    
    public var body: some View {
        let items: [GridItem] = Array(repeating: .init(.flexible()), count: columnCount)
        ScrollViewReader { scrollValue in
            TBSearchBar(text: $searchQuery)
                .padding()
            //Emoji Grid
            ScrollView {
                LazyVGrid(columns: items) {
                    ForEach(CategoryType.allCases, id: \.self) { category in
                        let emojis = getEmojiByCategory(for: category)
                        Section {
                            if !emojis.isEmpty {
                                ForEach(emojis, id: \.self) { emoji in
                                    Button(action: {selectedEmoji = emoji.string}) {
                                        Text(emoji.string)
                                            .emojiStyle()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .strokeBorder(selectedEmoji == emoji.string ? selectedColor : selectedColor.opacity(0), lineWidth: 3))
                                    }
                                }
                            }
                        } header: {
                            if !emojis.isEmpty {
                                Text(category.rawValue)
                                    .id(category.rawValue)
                            }
                        }
                    }
                }
            }
            // Bottom Navigation
            BottomNavigationView(scrollValue: scrollValue, bottomNavBar: bottomNavBar)
        }
    }
}




