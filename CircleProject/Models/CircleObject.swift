//
//  CircleObject.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 07/03/2021.
//

import Foundation
import SwiftUI

struct CircleObject {
    let name: String
    var users: [User] = []
    let image: Image?
    let type: CircleType
}

extension CircleObject{
    static var circles: [CircleObject]{
        return [CircleObject(name: "Amical", users: [User(name: "Abdel", email: "abdelkrim@gmail.com", password: "pass", userImage: "", age: "23", gender: "Homme", location: "Gray", categories: ["Sport"])], image: nil, type: .amical),
                CircleObject(name: "Famical", users: [], image: nil, type: .familial),
                CircleObject(name: "Professionnel", users: [], image: nil, type: .professioonnel),
                CircleObject(name: "Public", users: [], image: nil, type: .public)]
    }
    func addUser(_ user: User) {
        print("Ajout d'utilisateur")
    }
    func deleteUser(_ user: User) {
        print("Utilisateur supprimé")
    }
}

enum CircleType {
    case familial
    case amical
    case professioonnel
    case `public`
}
