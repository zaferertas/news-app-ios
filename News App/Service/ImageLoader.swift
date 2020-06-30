//
//  ImageLoader.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import UIKit
import Combine

class ImageCache {
    
    static let shared = ImageCache()
    
    var loaders: NSCache<NSString, ImageLoader> = NSCache()

    func loaderFor(urlToImage: String?) -> ImageLoader {
        
        guard let url = urlToImage, !url.isEmpty else {
            return ImageLoader()
        }
   
        if let cachedLoader = loaders.object(forKey: url as NSString) {
            return cachedLoader
        } else {
            let imageLoader = ImageLoader()
            imageLoader.load(urlString: url)
            loaders.setObject(imageLoader, forKey: url as NSString)
            return imageLoader
        }
    }
}
    

final class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?

    private var cancellable: AnyCancellable?
    
    func load(urlString: String) {

        cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
          .map { UIImage(data: $0.data) }
          .replaceError(with: nil)
          .receive(on: DispatchQueue.main)
          .assign(to: \.image, on: self)
    }

    deinit {
      cancellable?.cancel()
    }
}
