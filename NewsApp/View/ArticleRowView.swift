//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 22.06.2022.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: Article
    @State private var isPresented: Bool = false
    @State private var imageTapped: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10.0) {
            
            AsyncImage(url: article.imageURL) { image in
                
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: UIScreen.screenWidth * 0.9, height: 200, alignment: .center)
            
            .cornerRadius(20)
            .onTapGesture {
                self.isPresented.toggle()
            }
            .fullScreenCover(isPresented: $isPresented) {
                ArticleDetailView(article: article)
            }
            
            HStack(alignment: .center, spacing: 20) {
                
                Text(article.title ?? "").bold()
                    .font(.custom("Gill Sans", size: 18))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                CustomButton(imageTapped: $imageTapped, firstImage: "bookmark", secondImage: "bookmark.fill") {
                    imageTapped.toggle()
                    
                    // CoreData process
                }
            }.frame(width: UIScreen.screenWidth * 0.9, height: 100)
        }
    }
}


struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: Article.sampleData)
            .previewLayout(.sizeThatFits)
        
    }
}
