//
//  DataStore.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import Foundation
import SwiftUI
import MapKit

struct CardItem: Codable {
    enum CodingKeys: String, CodingKey {
        case profileImage = "user_image"
        case profileName = "username"
        case cardImage = "object_image"
        case title, price, description
        case card_id = "object_id"
        case category = "sub_category_name"
    }
    var profileImage: String
    var card_id: String
    var profileName: String
    var cardImage: String
    var title: String
    var category: String
    var price: String
    var description: String
}

struct CategorySelection: Codable {
    var category_id: String
    var category_name: String
    var image_name: String
}

struct SubCategorySelection: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "sub_category_name"
        case subCategoryId = "id"
    }
    var name: String
    var subCategoryId: String
}

struct ChecklistItem: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}

struct ImageUpload: Decodable {
    var status: Int
    var images: [String]
}

struct messagesServer: Decodable{
    var status: Int
    var status_message: String
    var user_id: String?
}

struct SellCategory: Identifiable {
    var id = UUID()
    var name: String
    var children:[SellCategory] = []
}

class Deal: ObservableObject {
    @Published var type: DealType = .offre
    @Published var categoryName = ""
    @Published var categoryId = ""
    @Published var title = ""
    @Published var price = ""
    @Published var city = ""
    @Published var dealDescription = ""
    @Published var images: [String] = []
    @Published var circles: [String] = []
    @Published var creator: DealCreator = DealCreator()
    @Published var maskPhoneNumber = "false"
}

enum DealType: String {
    case offre = "Offre"
    case demande = "Demande"
}

struct DealCreator {
    var email = ""
    var phoneNumber = ""
    static var stub: DealCreator{
        DealCreator(email: "creator@mail.fr", phoneNumber: "0624731093")
    }
}

struct Place: Identifiable {
    var id = UUID().uuidString
    var placemark: CLPlacemark
}

struct Circles {
    var id = UUID()
    var name:String
    static var circleList: [Circles] = [Circles(name: "Cercle Familial"),Circles(name: "Cercle Amical"),Circles(name: "Cercle Professionnel"),Circles(name: "Cercle Public")]
    var value = false
    var circleColor: [Color] = [Color(red: 253/255, green: 143/255, blue: 147/255),Color(red: 214/255, green: 101/255, blue: 105/255),Color(red: 235/255, green: 71/255, blue: 78/255),Color(red: 168/255, green: 42/255, blue: 48/255)]
}

class User: ObservableObject, Decodable, Identifiable {
    @Published var userCircleUserId: String
    @Published var id: String
    @Published var name: String
    @Published var email: String
    @Published var password: String
    @Published var userImage: String
    @Published var age: String
    @Published var gender: String
    @Published var location: String
    @Published var categories: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case name = "username"
        case id = "user_id"
        case userImage = "user_image"
        case userCircleUserId = "user_circle_users_id"
        case email,password,age,location,gender,categories
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
           
        self.id = try values.decode(String.self, forKey: .id)
           if let value = try? values.decode(String.self, forKey: .name) {
               self.name = value
           } else {
               self.name = ""
           }
           
        if let value = try? values.decode(String.self, forKey: .userCircleUserId) {
            self.userCircleUserId = value
        } else {
            self.userCircleUserId = ""
        }
        
        if let value = try? values.decode(String.self, forKey: .email) {
            self.email = value
        } else {
            self.email = ""
        }
        
        if let value = try? values.decode(String.self, forKey: .password) {
            self.password = value
        } else {
            self.password = ""
        }
        
        if let value = try? values.decode(String.self, forKey: .userImage) {
            self.userImage = value
        } else {
            self.userImage = ""
        }
        
        if let value = try? values.decode(String.self, forKey: .age) {
            self.age = value
        } else {
            self.age = ""
        }
        
        if let value = try? values.decode(String.self, forKey: .gender) {
            self.gender = value
        } else {
            self.gender = ""
        }
        
        if let value = try? values.decode(String.self, forKey: .location) {
            self.location = value
        } else {
            self.location = ""
        }
        
        if let value = try? values.decode([String].self, forKey: .categories) {
            self.categories = value
        } else {
            self.categories = []
        }
       }

    
    init(userCircleUserId: String = "", id: String = "",name: String = "", email: String = "",password:String = "",userImage:String = "",age:String = "",gender:String = "",location:String = "",categories:[String] = []) {
        self.userCircleUserId = userCircleUserId
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.userImage = userImage
        self.age = age
        self.gender = gender
        self.location = location
        self.categories = categories
    }
}


struct Location: Codable {
    var nom: String
    var code: String
}

struct Departement: Codable {
    var nom: String
    var code: String
    var departement: [String:String]
}

struct Notification: Codable {
    enum CodingKeys: String, CodingKey {
        case receiverId = "receiver_id"
        case senderId = "sender_id"
        case circleId = "circle_id"
        case text,id
    }
    var id: String
    var receiverId: String
    var senderId: String
    var circleId: String
    var text: String
}

struct applicationCircle: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "circle_id"
        case name = "circle_name"
    }
    var id: String
    var name: String
}
