//
//  SwiftUIView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 03/03/2021.
//

import SwiftUI
import MapKit
import Combine

struct UserPositionView: View {
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var shouldPopToRootView : Bool
    @Binding var userPosition: String
    
    var body: some View {
        ZStack{
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                Spacer()
                VStack(alignment: .trailing){
                    Button(action: {
                    mapData.focusLocation()
                    mapData.cityName = mapData.userLocation
                }, label: {
                    Image(systemName: "location.fill")
                        .font(.title2)
                        .padding(10)
                        .background(Color.primary)
                        .clipShape(Circle())
                })
                    Text(mapData.cityName)
                    Button {
                        self.shouldPopToRootView = false
                    } label: {
                        Text("Valider")
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.8)
                    .padding()
                    .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                    .cornerRadius(12)
                }.frame(maxWidth: .infinity)
                .padding()
            }.padding()
            
            .navigationBarHidden(true)
            .navigationTitle("")
        }.onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
    }
}

//struct UserPositionView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserPositionView(shouldPopToRootView: .constant(false), userPosition: "Paris")
//    }
//}
