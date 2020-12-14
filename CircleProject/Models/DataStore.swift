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
}

struct ChecklistItem: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}
