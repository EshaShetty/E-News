//
//  News.swift
//  E-News
//
//  Created by Esha Shetty on 2020-06-23.
//  Copyright © 2020 Esha Shetty. All rights reserved.
//

import Foundation

struct Response: Codable{
    var status: String?
    var totalResults: Int64?
    var articles: [ArticleDetail]
}

struct ArticleDetail: Codable{
    var source: Source
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable{
    var id: String?
    var name: String?
}
