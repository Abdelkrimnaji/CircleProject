//
//  SearchBarView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 03/05/2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State var placeholder = "Rechercher ..."
    @State private var isEditing = false
//    @State var objects: [CardItem]
    @State var isCommit = false
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text,
                        onCommit: {
                            isCommit = true
//                            print("commit \(isCommit)")
//                            Api().searchObject(object: text) { (objects, error) in
//                                if error != nil{
//                                    print(error!.localizedDescription)
//                                }else if let objects = objects{
//                                    self.objects = objects
//                                    dump(objects)
//                                }
//                            }
                        }
                    )
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    isCommit = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
