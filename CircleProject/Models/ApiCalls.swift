//
//  ApiCalls.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 07/12/2020.
//

import Foundation

struct Api {
    func getCategories(completion: @escaping ([CategorySelection]?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/categories")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ (data,response,error) in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
            }
            do{
                let category = try JSONDecoder().decode([CategorySelection].self, from: data)
                DispatchQueue.main.async {
                    completion(category,nil)
                    
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    func getObjects(completion: @escaping ([CardItem]?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/object/list")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ (data,response,error) in
            if error != nil{
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 1, userInfo: [NSLocalizedDescriptionKey:"Pas d'annonces disponible"]))
                }
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 999, userInfo: [NSLocalizedDescriptionKey:"Une erreur est survenu."]))
                }
                return
            }
            do{
                let object = try JSONDecoder().decode([CardItem].self, from: data)
                DispatchQueue.main.async {
                    completion(object,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    func login(username:String, password:String,completion: @escaping (messagesServer?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/user/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = "username=\(username)&password=\(password)"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ (data,response,error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 1, userInfo: [NSLocalizedDescriptionKey:"Identifiant ou maot de passe incorrect."]))
                }
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 999, userInfo: [NSLocalizedDescriptionKey:"Une erreur est survenu."]))
                }
                return
            }
            do{
                let requestResponse = try JSONDecoder().decode(messagesServer.self, from: data)
                DispatchQueue.main.async {
                    completion(requestResponse,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    func register(completion: @escaping (messagesServer?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/user/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
//        let body = "username=\(username)&firstname=\(firstname)&lastname=\(lastname)&email=\(email)&password=\(password)&user_image=\(user_image)&age=\(age)&location=\(location)"
        let body = "username=Cr7&firstname=Cristiano&lastname=Ronaldo&email=mail&password=pass&user_image=image&age=36&location=Torino"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ (data,response,error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 1, userInfo: [NSLocalizedDescriptionKey:"Erreur."]))
                }
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 999, userInfo: [NSLocalizedDescriptionKey:"Une erreur est survenu."]))
                }
                return
            }
            do{
                let requestResponse = try JSONDecoder().decode(messagesServer.self, from: data)
                DispatchQueue.main.async {
                    completion(requestResponse,nil)
                }
                print(requestResponse)
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    func sendMail(email:String,completion: @escaping (messagesServer?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/mail")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = "email=\(email)"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ (data,response,error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 1, userInfo: [NSLocalizedDescriptionKey:"L'email n'a pas été envoyé."]))
                }
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(nil,NSError(domain: "CircleProjetDomain", code: 999, userInfo: [NSLocalizedDescriptionKey:"Une erreur est survenu."]))
                }
                return
            }
            do{
                let requestResponse = try JSONDecoder().decode(messagesServer.self, from: data)
                DispatchQueue.main.async {
                    completion(requestResponse,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
}
