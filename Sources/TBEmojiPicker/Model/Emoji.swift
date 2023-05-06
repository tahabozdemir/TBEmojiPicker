//
//  Emoji.swift
//  TBEmojiPicker
//
//  Created by Taha Bozdemir on 30.04.2023.
//

import Foundation


public struct Emoji: Decodable, Hashable {
    public let string: String
    public let category: String
    public let description: String
}
