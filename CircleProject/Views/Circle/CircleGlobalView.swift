//
//  CircleGlobalView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/04/2021.
//

import SwiftUI

struct CircleGlobalView: View {
    @State var subscribersList: [User] = []
    var circle: CircleObject
    @State var isPresented = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.isPresented = true
                }, label: {
                    Text("Tous les abonnés")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                        .cornerRadius(12)
                }).fullScreenCover(isPresented: $isPresented, content: {
                    SubscriberView(circle: circle)
                })
                Spacer()
                NavigationLink(
                    destination: SubscriberConfigView(circle: circle),
                    label: {
                        Text("Ajouter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 84/255, green: 84/255, blue: 84/255))
                            .cornerRadius(12)
                    })
            }.padding()
            HStack {
                Text("Invitations")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.leading)
            Divider()
                .padding(.bottom)
            Image("friends")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width*0.5)
                .padding(.top)
            Text("Aucune nouvelle invitations")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.gray)
//            NavigationLink(
//                destination: SubscriberView(circle: circle),
//                label: {
                    Text("Invité des personnes")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color(red: 84/255, green: 84/255, blue: 84/255))
                        .cornerRadius(8)
//                })
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(circle.name)
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(circle.color)
            }
        }
    }
}

struct CircleGlobalView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGlobalView(circle: CircleObject.familial)
    }
}
