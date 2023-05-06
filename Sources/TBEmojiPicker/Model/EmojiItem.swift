//
//  File.swift
//  
//
//  Created by Taha Bozdemir on 5.05.2023.
//

import Foundation

struct EmojiItem {
    static let shared = EmojiItem()
    private (set) var emojiAll: [Emoji] = []
    
    init() {
        do {
            emojiAll = try decodeEmojis(at: "emoji")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    private func decodeEmojis(at resource: String) throws -> [Emoji] {
        if let url = Bundle.module.url(forResource: resource, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Emoji].self, from: data)
                return jsonData
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
        return [Emoji(string: "", category: "", description: "")]
    }
}
