//
//  DetailsView.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct ArticleDetailsView: View {
    
    var article : Article
    
    var body: some View {
        
        VStack {
            Text(article.title)
                .font(.headline)
            ImageView(urlToImage: article.urlToImage)

            Text(article.description ?? "")
            Text(article.content ?? "")
            Spacer()
        }

    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(article: sampleArticlesData[1])
    }
}


