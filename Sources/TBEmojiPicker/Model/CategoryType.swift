//
//  Category.swift
//  TBEmojiPicker
//
//  Created by Taha Bozdemir on 3.05.2023.
//

import Foundation

public enum CategoryType: String, CaseIterable {
    case smileys = "Smileys & Emotion"
    case people = "People & Body"
    case animals = "Animals & Nature"
    case food = "Food & Drink"
    case travel = "Travel & Places"
    case activities = "Activities"
    case objects = "Objects"
    case symbols = "Symbols"
    case flags = "Flags"
}

public let categoriesSymbol: [String : String] = [
    "Smileys & Emotion": "emoticons",
    "People & Body": "body",
    "Animals & Nature": "animals",
    "Food & Drink": "foods",
    "Travel & Places" : "travel",
    "Activities" : "activity",
    "Objects": "objects",
    "Symbols": "symbols" ,
    "Flags": "flags"
]
