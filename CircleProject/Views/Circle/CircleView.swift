//
//  CircleView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct CircleView: View {
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
//                ZStack{
//                    ForEach(CircleObject.circles.indices){ i in
//                        NavigationLink(
//                            destination: SubscriberView(circle: CircleObject.circles[(CircleObject.circles.count-1)-i]),
//                            label: {
//                                CircleObject.circles[(CircleObject.circles.count-1)-i].image
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: width*CGFloat(CircleObject.circles[(CircleObject.circles.count-1)-i].size))
//                            })
//                    }
//                }
                ZStack{
                    ForEach(CircleObject.circles.indices){ i in
                        NavigationLink(
                            destination: CircleGlobalView(circle: CircleObject.circles[(CircleObject.circles.count-1)-i]),
                            label: {
                                CircleObject.circles[(CircleObject.circles.count-1)-i].image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width*CGFloat(CircleObject.circles[(CircleObject.circles.count-1)-i].size))
                            })
                    }
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Configurez vos cercles")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                }
            }
        }
    }
}


struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
