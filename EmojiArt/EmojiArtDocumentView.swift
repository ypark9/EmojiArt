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
                .onDrop(of: ["public.image"], isTargeted: nil) { providers, location in
                    return self.drop(providers : providers)
            }
        }
    }
    
    private func drop(providers : [NSItemProvider])-> Bool {
        let found = providers.loadFirstObject(ofType: URL.self) { url in
            print("Dropped : \(url)")
            self.document.setBackgroundURL(url)
        }
        return found
    }
    
    private let defaultEmojiSize : CGFloat = 40
}
