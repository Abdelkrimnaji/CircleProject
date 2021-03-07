//
//  LocationView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 13/02/2021.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var dealOffer: Deal
    
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        ZStack{
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                VStack(spacing: 0){
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $mapData.searchTxt)
                            .colorScheme(.light)
                    }.padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.white)
                    
                    if !mapData.places.isEmpty && mapData.searchTxt != ""{
                        ScrollView{
                            VStack(spacing: 15){
                                ForEach(mapData.places){place in
                                    Text(place.placemark.name ?? "")
                                        .foregroundColor(.primary)
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading)
                                        .onTapGesture{
                                            mapData.selectPlace(place: place)
                                            if let SelectedCity = place.placemark.name{
                                                mapData.cityName = SelectedCity
                                            }
                                            UIApplication.shared.endEditing()
                                        }
                                    Divider()
                                }
                            }.padding(.top)
                        }.background(Color.white)
                    }
                }.padding()
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
                        dealOffer.city = mapData.cityName
                        self.shouldPopToRootView = false
                    } label: {
                        Text("Suivant")
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.8)
                    .padding()
                    .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                    .cornerRadius(12)
                    .disabled(mapData.cityName == "")
                }.frame(maxWidth: .infinity)
                .padding()
            }.padding()
        }.onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        .onChange(of: mapData.searchTxt, perform: { value in
            let delay = 0.3
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                if value == mapData.searchTxt{
                    self.mapData.searchQuery()
                }
            }
        })
    }
}

extension UIApplication {
      func endEditing() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(dealOffer: Deal(), shouldPopToRootView: .constant(false))
    }
}
