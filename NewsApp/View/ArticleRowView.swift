//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 22.06.2022.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: Article
    
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
                
            NavigationLink(destination: ArticleDetailView(article: article)) {
                Text(article.title ?? "").bold()
                    .multilineTextAlignment(.center)
            }
        }
    }
}


struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: Article.sampleData)
            .previewLayout(.sizeThatFits)
        
    }
}
