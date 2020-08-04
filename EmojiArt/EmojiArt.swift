//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Yoonsoo Park on 8/4/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import Foundation

struct EmojiArt {
    var backgroundURL : URL?
    var emojis = [emoji]()
    struct emoji : Identifiable {
       // for identify
        var id: Int
        
        let text : String
        var x : Int
        var y : Int
        var size : Int
        
        // only this file can make Emoji instance
        fileprivate init(text : String, x : Int, y : Int, size : Int, id : Int) {
            self.text = text;
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    private var uniqueEmojiID = 0
    
    mutating func addEmoji(_ text : String, x: Int, y : Int, size : Int) {
        uniqueEmojiID += 1
        emojis.append(emoji(text: text, x: x, y: y, size: size, id: uniqueEmojiID))
    }
}
