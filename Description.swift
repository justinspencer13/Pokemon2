//
//  Description.swift
//  Pokemon
//
//  Created by Justin Spencer on 4/28/24.
//

import Foundation
import SwiftData

@Model
class Description: Identifiable {
     var id = UUID()
     var title: String
     var review: String
     var imageData: Data?
    

    init(title: String, review: String, imageData: Data? = nil) {
        self.title = title
        self.review = review
        self.imageData = imageData
        
    }
}
