//
//  ConfigModalView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 16/04/2021.
//

import SwiftUI

struct ConfigModalView: View {
    var name: String
    var circle: String
    var userCircleUserId: String
    @State var changeCircle = false
    @State var circlesList: [applicationCircle] = []
    @State var selectedCircle = ""
    @State var circleId = ""
    var userId = UserDefaults.standard.string(forKey: "userId")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack {
                Spacer()
                Image(systemName: "minus")
                    .font(.title)
                    .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                Spacer()
            }
            HStack{
                Image("elon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .clipShape(Circle())
                Text(name)
            }
            Divider()
            if !changeCircle{
                Button {
                    Api().deleteUserFromCircle(userCircleUserId: userCircleUserId) { (message, error) in
                        if error != nil{
                            print(error!.localizedDescription)
                        }else if let message = message{
                            print(message.status)
                        }
                    }
                } label: {
                    HStack(alignment: .top){
                        Image(systemName: "trash.fill")
                        VStack(alignment: .leading) {
                            Text("Supprimer")
                            Text("Supprimer de la liste de vos abonnés")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }.foregroundColor(.primary)
                        Spacer()
                    }
                }
                Button(action: {
                    let str = circle.dropFirst(7)
                    self.selectedCircle = String(str)
                    self.changeCircle.toggle()
                }, label: {
                    HStack(alignment: .top){
                        Image(systemName: "repeat.circle.fill")
                        Text("Changer de cercle")
                        Spacer()
                    }.foregroundColor(.primary)
                })
                HStack(alignment: .top){
                    Image(systemName: "folder")
                    Text("Autre")
                    Spacer()
                }
            }else{
                VStack(alignment: .leading){
                LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                    ForEach(circlesList, id: \.id){ circle in
                        HStack {
                            if circle.name == selectedCircle {
                                Image(systemName:"largecircle.fill.circle")
                                    .font(.headline)
                                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                            }else{
                                Image(systemName: "circle")
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                            }
                        Text(circle.name)
                                .foregroundColor(.gray)
                            Spacer()
                        }.onTapGesture {
                            self.selectedCircle = circle.name
                            self.circleId = circle.id
                        }.padding(.top,5)
                    }
                })
                }.onAppear{
                    Api().getCircles { (circles, error) in
                        if error != nil{
                            print(error!.localizedDescription)
                        }else if let circles = circles{
                            self.circlesList = circles
                        }
                    }
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.changeCircle.toggle()
                        Api().updateUserCircle(userCircleUserId: userCircleUserId, senderId: userId!, circleId: circleId) { (message, error) in
                            if error != nil{
                                print(error!.localizedDescription)
                            }else if let message = message{
                                print(message.status)
                            }
                        }
                    }, label: {
                        Text("Valider")
                            .foregroundColor(.white)
                    })
                    .frame(width: UIScreen.main.bounds.width*0.5)
                    .padding(10)
                    .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                    .cornerRadius(12)
                    Spacer()
                }.padding(.top)
            }
        }.padding()
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

struct ConfigModalView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigModalView(name: "", circle: "", userCircleUserId: "")
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
