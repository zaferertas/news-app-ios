//
//  Repository.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation
import Combine

protocol ApiService {
    func fetchNews(endpoint: EndPoint) -> AnyPublisher<ArticlesResponse, Error>
    func fetchSources(endpoint: EndPoint) -> AnyPublisher<SourcesResponse, Error>
}

class ApiServiceImpl: ApiService {
        
    func fetchNews(endpoint: EndPoint) -> AnyPublisher<ArticlesResponse, Error> {
        run(endpoint.urlRequest)
    }

    func fetchSources(endpoint: EndPoint) -> AnyPublisher<SourcesResponse, Error> {
        run(endpoint.urlRequest)
    }
    
    private func run<T: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .retry(3)
            .timeout(3, scheduler: RunLoop.main)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            //.map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}

