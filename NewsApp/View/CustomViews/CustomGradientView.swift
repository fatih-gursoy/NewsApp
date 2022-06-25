//
//  CustomGradientView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 24.06.2022.
//

import SwiftUI

struct CustomGradientView: View {
       
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(LinearGradient(colors: [.black, .clear],
                                     startPoint: .bottom,
                                     endPoint: .top))
                .opacity(0.8)
     
        }
    }
}

struct CustomGradientView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGradientView()
            .previewLayout(.sizeThatFits)
    }
}
