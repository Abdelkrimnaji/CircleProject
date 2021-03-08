//
//  DepartementView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 02/03/2021.
//

import SwiftUI

struct DepartmentView: View {
    @State var department = ""
    @State var departmentsList: [Location] = []
    
    var body: some View {
        HStack {
            TextField("Département", text: $department)
                .font(.title2)
                .padding(.leading, 5)
        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
        ScrollView{
            ForEach(departmentsList, id: \.nom){ item in
                Text(item.nom)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading)
                    .onTapGesture{
                        self.department = item.nom
                        self.departmentsList.removeAll()
                    }
                Divider()
            }
            
        }.padding(.top)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(8)
        .frame(height: departmentsList.isEmpty ? 0 : UIScreen.main.bounds.height*0.15)
        .onChange(of: self.department) { (value) in
            Api().getDepartment(department: value, completion: {(department, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let departmentsList = department{
                    self.departmentsList = departmentsList
                }
            })
        }
    }
}

struct DepartementView_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentView()
    }
}
