//
//  ApiCalls.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 07/12/2020.
//

import Foundation

class Api {
    func getCategories(completion: @escaping ([CategorySelection]) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/category")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ (data,response,error) in
            
            
            guard let data = data, error == nil else {
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            guard let category: [CategorySelection] = try? JSONDecoder().decode([CategorySelection].self, from: data) else {
                return
            }
            DispatchQueue.main.async {
                completion(category)
            }
        }
        task.resume()
    }
    
    func getObjects(completion: @escaping ([CardItem]) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/object")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ (data,response,error) in
            
            guard let data = data, error == nil else {
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            guard let object: [CardItem] = try? JSONDecoder().decode([CardItem].self, from: data) else {
                return
            }
            DispatchQueue.main.async {
                completion(object)
            }
        }
        task.resume()
    }
}
