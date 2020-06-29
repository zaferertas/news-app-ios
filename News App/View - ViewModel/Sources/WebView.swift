//
//  WebView.swift
//  News App
//
//  Created by zafer ertas on 29.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI
import SafariServices

struct WebView : UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        let safariView = SFSafariViewController(url: url)
        safariView.preferredControlTintColor = UIColor.black
        return safariView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {}
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://abcnews.go.com")!)
    }
}
