//
//  postData.swift
//  Hacker News
//
//  Created by Diego Espinosa on 6/15/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    let points: Int
    let title: String
    let url: String?
    let objectID: String
    var id: String{
        return objectID
    }
}
