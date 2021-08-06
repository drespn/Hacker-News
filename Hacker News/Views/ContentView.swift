//
//  ContentView.swift
//  Hacker News
//
//  Created by Diego Espinosa on 6/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var nm = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(nm.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text("\(post.points)")
                            Text(post.title)
                        }
                    })
                
            }
            .navigationBarTitle("Hacker News 4u")
        }
        .onAppear(perform: {
            nm.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

