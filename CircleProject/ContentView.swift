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
    @State var isCommit = false
    
    var body: some View {
//        rs4(isCommit: $isCommit)
//        if isLogged{
        TabUIView(viewRouter: viewRouter)
//        }else{
//            FirstScreenView()
//        TutoCircles(circle: CircleObject.familial)
        //        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(arrayImage: [UIImage(named: "placeholder")])
//    }
//}
