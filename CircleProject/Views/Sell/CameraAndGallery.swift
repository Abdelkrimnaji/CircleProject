//
//  CameraAndGallery.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 30/01/2021.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    @Binding var arrayImage: [UIImage?]
    
    init(image: Binding<UIImage?>, isShown: Binding<Bool>,arrayImage: Binding<[UIImage?]>) {
        _image = image
        _isShown = isShown
        _arrayImage = arrayImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiImage
            isShown = false
            arrayImage.append(image)
            
            if arrayImage.count == 4{
                for i in 0...arrayImage.count{
                    if (image?.jpegData(compressionQuality: 0.9)) != nil {
                        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                        let url = documents.appendingPathComponent("2cv\(i).jpg")
                        var urlsArray = [url]
                        urlsArray.append(url)
                        dump(urlsArray)
                    }
                }
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    @Binding var arrayImage: [UIImage?]
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePickerCoordinator(image: $image, isShown: $isShown, arrayImage: $arrayImage)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
}

