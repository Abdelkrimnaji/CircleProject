//
//  DataStore.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import Foundation
import SwiftUI

struct CardItem: Identifiable {
    var id = UUID()
    var profileImageName: String
    var profileName: String
    var imageName: String
    var title: String
    var category: String
    var price: Double
}

struct CategorySelection: Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
}
