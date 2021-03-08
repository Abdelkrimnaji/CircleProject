//
//  ContentView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct ContentView: View {
    var isLogged = UserDefaults.standard.bool(forKey: "logged")
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View {
//        if isLogged{
//        TabUIView(viewRouter: viewRouter)
//        }else{
//            FirstScreenView()
        TutoCircles(circle: CircleObject.familial)
        //        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(arrayImage: [UIImage(named: "placeholder")])
//    }
//}
