//
//  DataStore.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import Foundation
import SwiftUI

//struct CardItem: Identifiable {
//    var id = UUID()
//    var profileImageName: String
//    var profileName: String
//    var cardImage: String
//    var title: String
//    var category: String
//    var price: Double
//}
struct CardItem: Codable {
    enum CodingKeys: String, CodingKey {
        case profileImage = "user_image"
        case profileName = "username"
        case cardImage = "object_image"
        case title, price, description
        case card_id = "object_id"
        case category = "category_name"
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
    var isSelectedCategory: String
}

struct ChecklistItem: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}

struct jsonResponse: Decodable {
    var status: Int
    var status_message: String
}

struct messagesServer: Decodable{
    var status: Int
    var status_message: String
}

struct SellCategory: Identifiable {
    var id = UUID()
    var name: String
    var children:[SellCategory] = []
    static var categoriesList: [SellCategory] = [
        SellCategory(name: "Mode",children:[SellCategory(name: "Vetements"),SellCategory(name: "Chaussure"),SellCategory(name: "Accessoires & Bagagerie"),SellCategory(name: "Montres & Bijoux"),SellCategory(name: "Equipement bébé"),SellCategory(name: "Vêtements bébé"),SellCategory(name: "Luxe & Tendances")]),
        SellCategory(name: "Véhicules",children:[SellCategory(name: "Voitures"),SellCategory(name: "Motos"),SellCategory(name: "Caravaning"),SellCategory(name: "Utilitaires"),SellCategory(name: "Camions"),SellCategory(name: "Nautisme"),SellCategory(name: "Equipement auto"),SellCategory(name: "Equipement moto"),SellCategory(name: "Equipement caravaning"),SellCategory(name: "Equipement nautisme")]),
        SellCategory(name: "Multimédia",children:[SellCategory(name: "Informatique"),SellCategory(name: "Consoles & Jeux vidéo"),SellCategory(name: "Image & Son"),SellCategory(name: "Téléphonie")]),
        SellCategory(name: "Immobilier",children:[SellCategory(name: "Vetements")]),
        SellCategory(name: "Loisirs",children:[SellCategory(name: "Vetements")]),
        SellCategory(name: "Maison",children:[SellCategory(name: "Vetements")]),
        SellCategory(name: "Animaux",children:[SellCategory(name: "Vetements")]),
        SellCategory(name: "Immobilier",children:[SellCategory(name: "Vetements")])
    ]
}

class Deal: ObservableObject {

    var type: DealType = .offre
    var category: SellCategory?
    @Published var title: String = ""
    @Published var price: String = ""
    var city: String = ""
    var description: String = ""
    var images: [UIImage] = []
//    var circles: [
    var creator: DealCreator = DealCreator()
    
}

enum DealType {
    case offre, demande
}

struct DealCreator {
    var email: String?
    var phoneNumber: String?
    static var stub: DealCreator{
        DealCreator(email: "mail", phoneNumber: "06")
    }
}
