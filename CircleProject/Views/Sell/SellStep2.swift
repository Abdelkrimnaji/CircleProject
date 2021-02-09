//
//  SellStep2.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 26/01/2021.
//

import SwiftUI

struct SellStep2: View {
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var image: UIImage?
    @State var arrayImage: [UIImage?]
    
    @State var annonceDescription = ""
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    fileprivate func GetPhoto() -> some View {
        return Button(action: {
            self.showSheet = true
        }, label: {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                Image("camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width*0.3)
                Image("plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width*0.11)
                    .padding(.bottom,-10)
                    .padding(.trailing,-10)
            }
            .edgesIgnoringSafeArea(.all)
        }).actionSheet(isPresented: $showSheet) {
            ActionSheet(title: Text("Photo").font(.title), buttons: [
                .default(Text("À partir de la bibliothèque").foregroundColor(.green)) {
                    self.showImagePicker = true
                    self.sourceType = .photoLibrary
                },
                .default(Text("Prendre une photo")) {
                    self.showImagePicker = true
                    self.sourceType = .camera
                },
                .cancel(Text("Annuler"))
            ])
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                VStack{
                    HStack {
                        Text("Photos & Description")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                        Spacer()
                    }
                    Spacer()
                    if arrayImage.count == 1{
                        GetPhoto()
                    }else if arrayImage.count == 2{
                        HStack{
                            Image(uiImage: arrayImage[1]!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: width*0.35,height: height*0.12)
                                .cornerRadius(10)
                            GetPhoto()
                        }
                    }else if arrayImage.count == 3{
                        VStack{
                            HStack{
                                Image(uiImage: arrayImage[1]!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width*0.35,height: height*0.12)
                                    .cornerRadius(10)
                                Image(uiImage: arrayImage[2]!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width*0.35,height: height*0.12)
                                    .cornerRadius(10)
                            }
                            GetPhoto()
                        }
                    }else if arrayImage.count == 4{
                        VStack(alignment: .leading){
                            HStack{
                                Image(uiImage: arrayImage[1]!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width*0.35,height: height*0.12)
                                    .cornerRadius(10)
                                Image(uiImage: arrayImage[2]!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width*0.35,height: height*0.12)
                                    .cornerRadius(10)
                            }
                            HStack {
                                Image(uiImage: arrayImage[3]!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width*0.35,height: height*0.12)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    Spacer()
                }.frame(height: height*0.3)
                Divider()
                    .padding(.vertical)
                HStack {
                    TextField("Description de l'annonce", text: $annonceDescription)
                        .font(.title2)
                        .padding(.leading, 5)
                }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                Spacer()
            }.fullScreenCover(isPresented: $showImagePicker){
                ImagePicker(image: self.$image, isShown: self.$showImagePicker, arrayImage: self.$arrayImage, sourceType: self.sourceType)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct SellStep2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SellStep2(arrayImage: [UIImage(named: "placeholder")!])
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
//            SellStep2(arrayImage: [UIImage(named: "placeholder")!])
        }
    }
}
