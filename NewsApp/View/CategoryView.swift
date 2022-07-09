//
//  CategoryView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 9.07.2022.
//

import SwiftUI

struct CategoryView: View {
        
    var body: some View {
        
       	NavigationView {
         
            VStack() {
                
                List {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.description).font(.title3)
                            .padding()
                    }
                }
                .listStyle(.insetGrouped)
                
            }.navigationTitle("Categories")
        }
        
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
