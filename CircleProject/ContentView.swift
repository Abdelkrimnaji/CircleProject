//
//  ContentView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct ContentView: View {
    var isLogged = UserDefaults.standard.bool(forKey: "logged")
    
    var body: some View {
//        if isLogged{
//            TabUIView()
//        }else{
            FirstScreenView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
