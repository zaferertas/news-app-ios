//
//  SearchViewModel.swift
//  News App
//
//  Created by zafer ertas on 27.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    let service = ApiServiceImpl()
    
    //input
    @Published var searchString: String = ""
    
    //Output
    @Published var state: LoadingState<Article> = .idle
    
    var cancellable: Set<AnyCancellable> = []

    init() {
        $searchString
        .debounce(for: 0.2, scheduler: RunLoop.main)
        .removeDuplicates()
        .setFailureType(to: Error.self)
        .filter({$0.count > 1})
        .removeDuplicates()
        .eraseToAnyPublisher()
        .flatMap {  (searchString) -> AnyPublisher<ArticlesResponse, Error> in
            //dself.state = .loading
            return self.service.fetchNews(endpoint: EndPoint.search(searchString: searchString))
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
