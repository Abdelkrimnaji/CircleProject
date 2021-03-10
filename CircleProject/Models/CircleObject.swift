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
    let image: Image
    let color: Color
    let type: CircleType
    let size: Double
}

extension CircleObject{
    static var circles: [CircleObject]{
        return [
            CircleObject(name: "Cercle Familial", users: [], image: Image("CercleFamille"), color: Color(red: 253/255, green: 143/255, blue: 147/255), type: .familial, size: 0.25),
            CircleObject(name: "Cercle Amical", users: [User(name: "Abdel", email: "abdelkrim@gmail.com", password: "pass", userImage: "", age: "23", gender: "Homme", location: "Gray", categories: ["Sport"])], image: Image("CercleAmical"), color: Color(red: 214/255, green: 101/255, blue: 105/255), type: .amical, size: 0.45),
            CircleObject(name: "Cercle Professionnel", users: [], image: Image("CercleProfessionnel"), color: Color(red: 235/255, green: 71/255, blue: 78/255), type: .professioonnel, size: 0.65),
            CircleObject(name: "Cercle Public", users: [], image: Image("CerclePublic"), color: Color(red: 168/255, green: 42/255, blue: 48/255), type: .public, size: 0.8)]
    }
    static var familial: CircleObject{
        CircleObject(name: "Cercle Familial", users: [], image: Image("CercleFamille"), color: Color(red: 0.996, green: 0.557, blue: 0.576), type: .familial, size: 0.25)
    }
//    static var amical: CircleObject{
//        CircleObject(name: "Cercle Amical", users: [], image: Image("CercleAmical"), color: Color(red: 0.996, green: 0.557, blue: 0.576), type: .amical)
//    }
//    static var professionnel: CircleObject{
//        CircleObject(name: "Cercle Professionnel", users: [], image: Image("CercleProfessionnel"), color: Color(red: 0.996, green: 0.557, blue: 0.576), type: .professioonnel)
//    }
    
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
