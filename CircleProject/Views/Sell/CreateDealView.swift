//
//  BuyView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct CreateDealView: View {
    @State private var annonceTitle = ""
    @State private var annoncePrice = ""
    @State private var isOfferChecked = false
    @State private var isRequestChecked = false
    @State private var width = UIScreen.main.bounds.width
    @State private var annonceStep = 25.0
    @StateObject private var dealOffer: Deal = Deal()
    
    @State private var selection = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30) {
//                if annonceStep == 25{
                SellStep1(annonceStep: $annonceStep, dealOffer: dealOffer)
//                }else if annonceStep == 50{
//                    SellStep2(arrayImage: [UIImage(named: "placeholder")!])
//                }else if annonceStep == 75{
//                    SellStep3()
//                }else if annonceStep == 100{
//                    SellStep4()
//                }
                
                
//                ZStack(alignment: .bottom) {
//                    TabView(selection: $selection) {
//                        SellStep1(annonceStep: $annonceStep, dealOffer: dealOffer).tag(0)
//                        SellStep2(arrayImage: [UIImage(named: "placeholder")!]).tag(1)
//                        SellStep3().tag(2)
//                        SellStep4().tag(3)
//                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//                }
                
                
                VStack {
                    if annonceStep <= 100 {
                        HStack{
                            Spacer()
                            Text("\(annonceStep/25, specifier: "%.f") sur 4")
                        }
                        ProgressView("", value: annonceStep, total: 100)
                    }
                }.padding(.horizontal)
                
                Button(action: {
                    withAnimation {
                        self.annonceStep += 25
//                        selection += 1
                    }
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
