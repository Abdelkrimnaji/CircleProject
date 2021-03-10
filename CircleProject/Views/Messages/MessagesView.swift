//
//  MessagesView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct MessagesView: View {
    @State var noticationsList: [Notification] = []
    var body: some View {
        VStack{
            ForEach(noticationsList, id: \.id){ notification in
                NotificationsItem(notification: notification)
            }
        }.onAppear{
            Api().getNotifications { (notification,error)  in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let notications = notification{
                    self.noticationsList = notications
                }
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}

struct NotificationsItem: View  {
    var notification: Notification
    
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
            }.padding()
            Divider()
        }
//        .background(Color.blue.opacity(0.3))
    }
}
