//
//  BuyView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct CreateDealView: View {
    @State private var isOfferChecked = false
    @State private var isRequestChecked = false
    @State private var width = UIScreen.main.bounds.width
    @State private var annonceStep = 25.0
    @State private var isMainMenuPresented = false
    @StateObject var viewRouter = ViewRouter()
    @StateObject var dealOffer: Deal = Deal()
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30) {
                if annonceStep == 25{
                    SellStep1(dealOffer: dealOffer)
                }else if annonceStep == 50{
                    SellStep2(arrayImage: [], dealOffer: dealOffer)
                }else if annonceStep == 75{
                    SellStep3(dealOffer: dealOffer)
                }else if annonceStep == 100{
                    SellStep4(dealOffer: dealOffer)
                }
                VStack {
                    if annonceStep <= 100 {
                        HStack{
                            Spacer()
                            Text("\(annonceStep/25, specifier: "%.f") sur 4")
                                .foregroundColor(.primary)
                        }
                        ProgressView("", value: annonceStep, total: 100)
                    }
                }.padding(.horizontal)
                
                Button(action: {
                    if annonceStep < 100{
                        self.annonceStep += 25
                    }else{
                        self.isMainMenuPresented.toggle()
                        Api().addObjects(dealOffer: dealOffer) { (message, error) in
                            print(dealOffer.creator.email)
                        }
                    }
                }, label: {
                    if annonceStep == 100{
                        Text("Valider")
                            .foregroundColor(.white)
                    }else{
                        Text("Suivant")
                            .foregroundColor(.white)
                    }
                }).fullScreenCover(isPresented: $isMainMenuPresented){
                    TabUIView(viewRouter: viewRouter)
                }
                .frame(width: width*0.8)
                .padding()
                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                .cornerRadius(12)
            }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Déposer une annonce")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                }
            }
        }
    }
}

struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        CreateDealView()
    }
}
