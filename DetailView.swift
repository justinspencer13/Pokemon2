//
//  DetailView.swift
//  Pokemon
//
//  Created by Justin Spencer on 4/28/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingAddScreen = false
    //@State private var descriptions: [Description] = []
    @Binding var descriptions: [Description]
    let pokemon: Pokemon
    
    
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(descriptions.reversed()) { description in
                    Section(header: Text(description.title)) {
                        VStack(alignment: .leading) {
                            Text(description.review)
                                .foregroundColor(.secondary)
                            if let imageData = description.imageData, let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    
                }
                .listStyle(.grouped)
            }
            
            
            
            .navigationTitle("\(pokemon.name)")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Description", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            
            .sheet(isPresented: $showingAddScreen) {
                AddDescriptionView(descriptions: $descriptions)
            }
            
        }
        
        
        
        
    }
    
    
}
