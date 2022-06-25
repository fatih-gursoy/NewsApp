//
//  NewDetailView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 22.06.2022.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: article.imageURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.6)
                    .overlay(CustomGradientView())
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(article.title ?? "")
                            .foregroundColor(.white)
                            .font(.custom("Gill Sans", size: 22))
                            .bold()
                            .multilineTextAlignment(.leading)
                        
                        Text(article.date ?? "")
                            .foregroundColor(.white)
                            .font(.custom("Gill Sans", size: 14))
                    }
                    .padding()
                }
                
                Text(article.articleDescription ?? "")
                    .font(.custom("Gill Sans", size: 18))
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                
                Spacer()

            }
            .edgesIgnoringSafeArea(.top)
        }
        
    }
}




struct NewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article.sampleData)
        
    }
}

