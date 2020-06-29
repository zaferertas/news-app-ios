//
//  MainViewModel.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation
import Combine

class TopHeadlinesViewModel: ObservableObject {
    
    let service = ApiServiceImpl()
    
    //input
    @Published var category: Category = .general
    @Published var country: Country = .us
    
    //Output
    @Published var state: LoadingState<Article> = .loading
    
    var cancellable: Set<AnyCancellable> = []
//
//    init() {
//        self.loadNews()
//    }
//
    func loadNews() {
        
        Publishers.CombineLatest($category, $country)
        .setFailureType(to: Error.self)
        .flatMap {  (category, country) -> AnyPublisher<ArticlesResponse, Error> in
            return self.service.fetchNews(endpoint: EndPoint.news(category: category, country: country))
        }
        .sink(
            receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.state = .error(error: error)
            }},
              receiveValue: { response in
                self.state = .loaded(items: response.articles)

            })
        .store(in: &self.cancellable)
        
    }
}
