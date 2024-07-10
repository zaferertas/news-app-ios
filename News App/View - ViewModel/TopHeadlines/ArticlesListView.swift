//
//  ArticlesListView.swift
//  News App
//
//  Created by zafer ertas on 24.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct ArticlesListView: View {
    
    var state: LoadingState<Article>
    
    var body: some View {

        switch state {
            case .idle:
                //show nothing
                return AnyView(Text(""))
            case .loading:
                 return AnyView(Text("Loading...")
                    .font(.title))
            case .loaded(let articles ):
                return AnyView(list(of: articles))
            case .error(let error):
                 return AnyView(Text(error.localizedDescription)
                    .multilineTextAlignment(.center))
            }
    }
    
    private func list(of articles: [Article]) -> some View {
        
        return  List {
            ForEach(articles) { article in
                    ArticleRowView(article: article)
            }
        }
    }
}

struct ArticlesListView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ArticlesListView(state: LoadingState.loading)
            ArticlesListView(state: LoadingState.loaded(items: sampleArticlesData))
            ArticlesListView(state: LoadingState.error(error: NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Some error"])))
        }

    }
}


