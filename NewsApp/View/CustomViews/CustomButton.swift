//
//  CustomButton.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 26.06.2022.
//

import SwiftUI

struct CustomButton: View {
    
    @Binding  var imageTapped: Bool
    
    var firstImage: String?
    var secondImage: String?
    var action: () -> ()
    
    var body: some View {
        
        Image(systemName: imageTapped ? "bookmark.fill" : "bookmark").resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundColor(.gray)
            .onTapGesture {
                imageTapped.toggle()
            }
    }
}
