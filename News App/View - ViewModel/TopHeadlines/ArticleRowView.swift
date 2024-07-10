//
//  ArticleRowView.swift
//  News App
//
//  Created by zafer ertas on 24.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct ArticleRowView: View {
    
    var article : Article
    
    var body: some View {
        NavigationLink(destination: ArticleDetailsView(article: article)) {
            HStack {
                ImageView(urlToImage: article.urlToImage)
                    .frame(width: 120.0)
                Text(article.title).font(.headline)
            }
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: sampleArticlesData[0])
    }
}
