//
//  Product.swift
//  productListCarousel
//
//  Created by Aadish Jain on 16/05/25.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let image: String
    let tags: [String]
    let title: String
    let rating: Double
    let discount: String?
    let price: String
    let mrp: String?
}
