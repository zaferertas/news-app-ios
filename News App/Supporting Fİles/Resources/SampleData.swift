//
//  Data.swift
//  News App
//
//  Created by zafer ertas on 28.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

let sampleArticlesData: [Article] = load("sampleArticlesData.json")
let sampleSourcesData: [Source] = load("sampleSourcesData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
