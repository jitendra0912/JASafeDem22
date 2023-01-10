//
//  SearchViewComponent.swift
//  JASafeDemoV
//
//  Created by Jitendra Agarwal on 28/12/22.
//

import SwiftUI

import SwiftUI

struct SearchViewComponent: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
           Image(systemName: "magnifyingglass")
          .foregroundColor(Color.gray)
            TextField("Search", text: $searchText)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .overlay(Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x: 10)
                    .foregroundColor(Color.gray)
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                         ,alignment: .trailing).onTapGesture {
                        searchText = ""
                    }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme2.secondaryText)
            )
        .padding()
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchViewComponent(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)

            SearchViewComponent(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
    }
}
