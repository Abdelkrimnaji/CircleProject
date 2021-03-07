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
    
    func getSubCategories(categoryId: String,completion: @escaping ([SubCategorySelection]?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/categories/sub")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = "subCategoryId=\(categoryId)"
        request.httpBody = body.data(using: .utf8)
        
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
                let subCategory = try JSONDecoder().decode([SubCategorySelection].self, from: data)
                DispatchQueue.main.async {
                    completion(subCategory,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    func uploadImages(image: [String],completion: @escaping (ImageUpload?,Error?) -> ()) {
        guard let url: URL = URL(string: "http://localhost/CircleApiV2/upload_image.php")else {
            print("invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let images = image.joined(separator: ",")
        let body = "image=\(images)"
        request.httpBody = body.data(using: .utf8)
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
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
                let requestResponse = try JSONDecoder().decode(ImageUpload.self, from: data)
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
    
    func register(user: User,completion: @escaping (messagesServer?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/user/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = "name=\(user.name)&email=\(user.email)&password=\(user.password)&user_image=\(user.userImage)&age=\(user.age)&gender=\(user.gender)&location=\(user.location)"
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
    
    func addObjects(dealOffer: Deal,completion: @escaping (messagesServer?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/object/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let stringCircles = dealOffer.circles.joined(separator: ",")
        let stringImages = dealOffer.images.joined(separator: ",")
        let body = "title=\(dealOffer.title)&type=\(dealOffer.type.rawValue)&images=\(stringImages)&description=\(dealOffer.dealDescription)&price=\(dealOffer.price)&location=\(dealOffer.city)&category=\(dealOffer.categoryId)&mask_phone_number=\(dealOffer.maskPhoneNumber)&mask_phone_number=\(dealOffer.maskPhoneNumber)&creator_email=\(dealOffer.creator.email)&creator_phone=\(dealOffer.creator.phoneNumber)&circles=\(stringCircles)"
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
    
    func getUsers(username: String,completion: @escaping ([Users]?,Error?) -> ()) {
        let url = URL(string: "http://localhost/CircleApiV2/index.php/user/list")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = "username=\(username)"
        request.httpBody = body.data(using: .utf8)
        
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
                let users = try JSONDecoder().decode([Users].self, from: data)
                DispatchQueue.main.async {
                    completion(users,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
        task.resume()
    }
    
    func getRegion(region: String,completion: @escaping ([Location]?,Error?) -> ()) {
        guard let url = URL(string: "https://geo.api.gouv.fr/regions?nom=\(region)&limit=5")else{
            return
        }
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
                let region = try JSONDecoder().decode([Location].self, from: data)
                DispatchQueue.main.async {
                    completion(region,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                print(error)
            }
        }
        task.resume()
    }
    
    func getDepartment(department: String,completion: @escaping ([Location]?,Error?) -> ()) {
        guard let url = URL(string: "https://geo.api.gouv.fr/departements?nom=\(department)&limit=5")else{
            return
        }
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
                let department = try JSONDecoder().decode([Location].self, from: data)
                DispatchQueue.main.async {
                    completion(department,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                print(error)
            }
        }
        task.resume()
    }
    
    func getCity(city: String,completion: @escaping ([Departement]?,Error?) -> ()) {
//        guard let url = URL(string: "https://geo.api.gouv.fr/communes?nom=\(city)&fields=departement&boost=population&limit=5")else{
//            return
//        }
        guard let url = URL(string:"https://geo.api.gouv.fr/communes?nom=\(city)&fields=code,nom,departement,region")else{
            return
        }
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
                let city = try JSONDecoder().decode([Departement].self, from: data)
                DispatchQueue.main.async {
                    completion(city,nil)
                }
            }catch(let error){
                DispatchQueue.main.async {
                    completion(nil,error)
                }
                print(error)
            }
        }
        task.resume()
    }
}
