//
//  SellStep3.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 01/02/2021.
//

import SwiftUI

struct SellStep3: View {
    @State private var diffuseForFamily = false
    @State private var diffuseForFriends = false
    @State private var diffuseForPro = false
    @State private var diffuseForPublic = false
    @State var circle = [Circles(name: "Cercle Familial"),Circles(name: "Cercle Amical"),Circles(name: "Cercle Professionnel"),Circles(name: "Cercle Public")]
    @ObservedObject var dealOffer: Deal
    
    var body: some View {
        VStack {
            HStack {
                Text("Configuration de la liste de diffusion")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                Spacer()
            }.padding(.bottom)
            HStack {
                Text("Choisissez les cercles qui visualiseront votre annonce. Vous pouvez modifiez à tout moment cette liste de diffusion dans les paramètres de votre annonce.")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .opacity(0.6)
                    .padding(.bottom)
                Spacer()
            }.padding(.bottom)
            ForEach(circle.indices){ i in
                Toggle(isOn: $circle[i].value){
                    Text(circle[i].name)
                        .fontWeight(.bold)
                        .foregroundColor(circle[i].circleColor[i])
                }.padding(.horizontal)
                .onChange(of: circle[i].value, perform: { value in
                    if value{
                        dealOffer.circles.append(circle[i].name)
                    }else{
                        let index = dealOffer.circles.firstIndex(of: circle[i].name)
                        dealOffer.circles.remove(at: index!)
                    }
                })
            }.padding(.top)
            Spacer()
        }.toggleStyle(SwitchToggleStyle(tint: Color(red: 253/255, green: 143/255, blue: 147/255)))
    }
}

struct SellStep3_Previews: PreviewProvider {
    static var previews: some View {
        SellStep3(dealOffer: Deal())
    }
}
