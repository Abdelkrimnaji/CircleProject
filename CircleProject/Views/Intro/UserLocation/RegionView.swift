//
//  RegionView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 02/03/2021.
//

import SwiftUI

struct RegionView: View {
    @State var region = ""
    @State var regionsList: [Location] = []
    
    var body: some View {
        HStack {
            TextField("Région", text: $region)
                .font(.title2)
                .padding(.leading, 5)
        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                ScrollView{
                    ForEach(regionsList, id: \.nom){ item in
                        Text(item.nom)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                            .onTapGesture{
                                self.region = item.nom
                                self.regionsList.removeAll()
                            }
                        Divider()
                    }

                }.padding(.top)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(8)
                .frame(height: regionsList.isEmpty ? 0 : UIScreen.main.bounds.height*0.15)
                .onChange(of: self.region) { (value) in
                    Api().getRegion(region: value, completion: {(regions, error) in
                        if error != nil{
                            print(error!.localizedDescription)
                        }else if let regionsList = regions{
                            self.regionsList = regionsList
                        }
                    })
                }
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView()
    }
}
