//
//  SwiftUIView.swift
//  
//
//  Created by Taha Bozdemir on 3.05.2023.
//

import SwiftUI

struct TBSearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
        
    var body: some View {
            TextField("Search Emojis", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 7)
                        
                        if isEditing && !text.isEmpty {
                            Button {
                                self.text = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 5)
                .onTapGesture {
                    self.isEditing = true
                }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        TBSearchBar(text: .constant(""))
    }
}
