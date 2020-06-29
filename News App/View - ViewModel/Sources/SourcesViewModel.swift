//
//  MainViewModel.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation
import Combine

class SourcesViewModel: ObservableObject {

    //Output
    @Published var state: LoadingState<Source> = .loading
    
    var cancellable: AnyCancellable?
    
    init() {
        loadSources()
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    private func loadSources() {
        
        let service = ApiServiceImpl()
        cancellable = service.fetchSources(endpoint: EndPoint.sources)
            .sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.state = .error(error: error)
                    print(self.state)
                case .finished:
                    //self._isFetching.accept(false)
                    break
                }
            },
            receiveValue: { response in
                self.state = .loaded(items: response.sources)

            }
        )
    }

}
