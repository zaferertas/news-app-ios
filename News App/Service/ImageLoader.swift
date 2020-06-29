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
        
        guard let url = urlToImage else {
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

//final class ImageLoader: ObservableObject {
//    private let url: URL
//
//    static var cache = ImageCache()
//    @Published var image: UIImage?
//
//    private var cancellable: AnyCancellable?
//
//    init(url: URL) {
//        self.url = url
//        load()
//    }
//
//    private func load() {
//        if let image = ImageLoader.cache[url] {
//            self.image = image
//            return
//        }
//
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            //.map { UIImage(data: $0.data) }
//            .tryMap { [weak self] data, _ in
//                guard let image = UIImage(data: data) else {
//                    throw URLError(.badServerResponse)
//                }
//
//                if let self = self {
//                    ImageLoader.self.cache.setObject(image, forKey: self.url as NSURL)
//                }
//
//                return image
//            }
//            .replaceError(with: nil)
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.image, on: self)
//    }
//
//    deinit {
//        cancellable?.cancel()
//    }
//}

//class ImageCache: NSCache<NSURL, UIImage> {
//    subscript(_ key: URL) -> UIImage? {
//        get {
//            object(forKey: key as NSURL)
//        }
//        set {
//            newValue == nil ? removeObject(forKey: key as NSURL) : setObject(newValue!, forKey: key as NSURL)
//        }
//    }
//}
