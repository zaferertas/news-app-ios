//
//  EndPoint.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation

enum EndPoint {
    
    case news (category: Category, country: Country)
    case sources
    case search (searchString: String)

    var urlRequest : URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        
        let apiKey = "b86958ea5abd48a59c94e4f2d72cdf6f"
        var queryItems = [URLQueryItem(name: "apiKey", value: apiKey)]

        switch self {
            case .news(category: let category, country: let country):
                components.path = "/v2/top-headlines"
                queryItems.append(URLQueryItem(name: "country", value: country.rawValue))
                queryItems.append(URLQueryItem(name: "category", value: category.rawValue))

            case .sources:
                components.path = "/v2/sources"
            
            case .search(searchString: let searchString):
                components.path = "/v2/everything"
                queryItems.append(URLQueryItem(name: "q", value: searchString))
        }
        components.queryItems = queryItems

        var request = URLRequest(url: components.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
    
}
