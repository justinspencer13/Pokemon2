//
//  AddDescriptionView.swift
//  Pokemon
//
//  Created by Justin Spencer on 4/28/24.
//

import SwiftUI
import SwiftData

struct AddDescriptionView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Binding var descriptions: [Description]
    @State private var title = ""
    @State private var review = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("Title"){
                    TextField("Title", text: $title)
                }
                
                Section("Write a description") {
                        TextEditor(text: $review)
                        }
                
                Section {
                        Button("Take a Photo") {
                                        showingImagePicker = true
                                    }
                                }
                                
                                Section {
                                    if let image = inputImage {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                Section {
                                  Button("Save") {
                                      if let uiImage = inputImage, let imageData = uiImage.jpegData(compressionQuality: 0.8) {
                                          let newDescription = Description(title: title, review: review, imageData: imageData)
                                          modelContext.insert(newDescription)
                                          descriptions.append(newDescription)
                                          dismiss()
                                      } else {
                                          let newDescription = Description(title: title, review: review)
                                          modelContext.insert(newDescription)
                                          descriptions.append(newDescription)
                                          dismiss()
                                      }
                                  }
                              }
                
               
            }
            
            .navigationTitle("Add description")
            .sheet(isPresented: $showingImagePicker) {
                            ImagePicker(image: $inputImage)
                        }
        }
    }
}



