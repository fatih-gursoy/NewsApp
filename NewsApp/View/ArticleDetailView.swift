//
//  NewDetailView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 22.06.2022.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    
    @State private var imageTapped: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        GeometryReader { geo in
            
            NavigationView {
                
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
                        }.padding()
                    }
                    
                    Text(article.articleDescription ?? "")
                        .font(.custom("Gill Sans", size: 18))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 20) {
                        
                        Spacer()
                        
                        CustomButton(imageTapped: $imageTapped, firstImage: "bookmark", secondImage: "bookmark.fill") {
                            imageTapped.toggle()
                            
                            // CoreData process
                            
                        }
                        
                        Button {
                            //Share Process
                        } label: {
                            Image(systemName: "square.and.arrow.up.fill").resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                        }
                    }.padding()
                }
                .edgesIgnoringSafeArea(.top)
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark.circle.fill").resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            }
                        }
                    }
            }
        }
        
        
    }
    
}




struct NewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article.sampleData)
        
    }
}

