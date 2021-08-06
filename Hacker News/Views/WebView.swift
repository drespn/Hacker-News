//
//  WebView.swift
//  Hacker News
//
//  Created by Diego Espinosa on 6/15/21.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    
    var urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
