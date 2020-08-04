//
//  ContentView.swift
//  EmojiArt
//
//  Created by Yoonsoo Park on 8/3/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document : EmojiArtDocument
    
    var body : some View {
        VStack{
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map{String($0)}, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: self.defaultEmojiSize))
                    }
                }
            }
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
    
    private let defaultEmojiSize : CGFloat = 40
}
