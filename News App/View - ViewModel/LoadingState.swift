//
//  LoadingState.swift
//  News App
//
//  Created by zafer ertas on 21.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation

enum LoadingState<Item> {
    case idle
    case loading
    case loaded(items: [Item])
    case error(error: Error)
}
