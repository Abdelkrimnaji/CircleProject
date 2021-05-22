//
//  NotificationsView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 16/03/2021.
//

import SwiftUI

struct NotificationsView: View {
    @State var noticationsList: [Notification] = []
    var userId = UserDefaults.standard.string(forKey: "userId")
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(noticationsList, id: \.id){ notification in
                    NotificationsItem(notification: notification, circle: CircleObject.familial)
                }
                Spacer()
            }.onAppear{
                Api().getNotifications(userId: userId!) { (notification,error)  in
                    if error != nil{
                        print(error!.localizedDescription)
                    }else if let notications = notification{
                        self.noticationsList = notications
                    }
                }
            }
            .navigationBarTitle("Notifications")
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

struct NotificationsItem: View  {
    var notification: Notification
    var circle: CircleObject
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                VStack(alignment: .leading){
                    Text(notification.text)
                    Text(" 5 mars, à 20h30")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                HStack{
                    Image(systemName: "xmark.circle")
                        .font(.title)
                    Button {
                        showingAlert = circle.addUser(sender: notification.senderId, receiver: notification.receiverId, circle: notification.circleId)
                        
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Alert"), message: Text("Vous avez une nouvelle personne dans votre cercle !"), dismissButton: .default(
                            Text("Ok")))
                    }

//                    Image(systemName: "checkmark.circle")
//                        .font(.title)
//                        .onTapGesture {
////                            circle.addUser(sender: notification.senderId, receiver: notification.receiverId, circle: notification.circleId)
//                            showingAlert = circle.addUser(sender: notification.senderId, receiver: notification.receiverId, circle: notification.circleId)
//                        }
                }
            }.padding()
            Divider()
        }
//        .background(Color.blue.opacity(0.3))
    }
}
