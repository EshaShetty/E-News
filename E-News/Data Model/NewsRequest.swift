//
//  NewsRequest.swift
//  E-News
//
//  Created by Esha Shetty on 2020-06-23.
//  Copyright © 2020 Esha Shetty. All rights reserved.
//

import Foundation

enum ArticleError: Error{
    case noDataAvailable
    case cannotProcessData
}

struct NewsRequest{
    let resourceURL: URL
    let API_KEY = "0f76f4b4dc814d0399f61ffb17bb61e2"
    
    init(country: String){
        
        let resourceString = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(API_KEY)"
        
        guard let resourceURL = URL(string: resourceString)
            else{ fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getArticles(completion: @escaping(Result<[ArticleDetail], ArticleError>)-> Void){
        
        //getting information from Web API
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, response, error in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                //let jsonString = String(data: jsonData, encoding: .utf8)
                //print(jsonString)
                let response = try decoder.decode(Response.self, from: jsonData)
                let articleDetail = response.articles
                print(response.articles.count)
                completion(.success(articleDetail))
            }catch{
                print(error)
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
}
