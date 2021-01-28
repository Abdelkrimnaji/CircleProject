//
//  BuyView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct SellView: View {
    @State private var annonceTitle = ""
    @State private var annoncePrice = ""
    @State private var isOfferChecked = false
    @State private var isRequestChecked = false
    private var width = UIScreen.main.bounds.width
    @State private var annonceStep = 25.0
    var body: some View {
        NavigationView{
            VStack(spacing: 30) {
                if annonceStep == 25{
                    SellStep1()
                }else if annonceStep == 50{
                    SellStep2()
                }
                //            if registerStep <= 100{
                VStack {
                    HStack{
                        Spacer()
                        Text("\(annonceStep/25, specifier: "%.f") sur 4")
                    }
                    ProgressView("", value: annonceStep, total: 100)
                }.padding(.horizontal)
                //            }
                Button(action: {
                    self.annonceStep += 25
                    //                if registerStep > 100{
                    //                    self.isCategorySelectionPresented.toggle()
                    //                }
                }, label: {
                    Text("Suivant")
                        .foregroundColor(.white)
                })
                .frame(width: width*0.8)
                .padding()
                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                .cornerRadius(20)
            }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Déposer une annonce")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                }
            }
        }
    }
}

struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        SellView()
    }
}
