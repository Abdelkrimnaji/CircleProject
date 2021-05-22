//
//  SubscriberView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 07/04/2021.
//

import SwiftUI

struct SubscriberView: View {
    @State var subscribersList: [User] = []
    var circle: CircleObject
    var userId = UserDefaults.standard.string(forKey: "userId")
    @State private var isPresented = false
    @State var name = ""
    @State var userCircleUserId = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                VStack{
                    ZStack{
                        Text(circle.name)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(circle.color)
                        HStack {
                            Image("arrow_left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10)
                            if circle.name != "Cercle Professionnel"{
                                Text("Retour")
                            }
                            Spacer()
                        }.foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                        .padding(.leading)
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }.padding(.top,5)
                if subscribersList.count > 0{
                    ScrollView{
                        ForEach(subscribersList, id: \.id){ subscriber in
                            Divider()
                            HStack{
                                Image("elon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                                    .clipShape(Circle())
                                Text(subscriber.name)
                                Spacer()
                                Button(action: {
                                    isPresented.toggle()
                                    self.name = subscriber.name
                                    self.userCircleUserId = subscriber.userCircleUserId
                                }, label: {
                                    Image(systemName: "ellipsis")
                                })
                            }.padding()
                        }
                    }.background(Color.white.edgesIgnoringSafeArea(.all))
                }else{
                    ScrollView{
                        Divider()
                        Image("undraw_connection")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width*0.5)
                            .padding(.top)
                        Text("Aucun abonné dans ce cercle")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }.frame(width: UIScreen.main.bounds.width)
                    .background(Color.white.edgesIgnoringSafeArea(.bottom))
                }
            }.onAppear{
                Api().getUserContacts(circleId: circle.id, userId: userId!) { (subscriber, error) in
                    if error != nil{
                        print(error!.localizedDescription)
                    }else if let subscriber = subscriber{
                        subscribersList = subscriber
                    }
                }
            }
            Rectangle().fill(Color(red: 0, green: 0, blue: 0, opacity: isPresented ? 0.4 : 0)).edgesIgnoringSafeArea(.top)
                .onTapGesture {
                    withAnimation {
                        self.isPresented.toggle()
                    }
                }
            if isPresented{
                ConfigModalView(name: name, circle: circle.name, userCircleUserId: userCircleUserId)
            }
        }.background(Color(red: 247/255, green: 247/255, blue: 247/255).edgesIgnoringSafeArea(.all))
    }
}

struct SubscriberView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberView(circle: CircleObject.familial)
    }
}
