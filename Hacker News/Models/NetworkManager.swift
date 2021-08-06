//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Diego Espinosa on 6/15/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()//parenthenssis initialize an empty array
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits//contentView is updated quickly despite slow connection
                            }
                            
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
