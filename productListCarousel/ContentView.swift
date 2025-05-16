//
//  ContentView.swift
//  productListCarousel
//
//  Created by Aadish Jain on 16/05/25.
//

//MARK: Product Details Schema
import SwiftUI

struct ContentView: View {
    let products: [Product] = [
        Product(image: "milk", tags: ["500 ML"], title: "Amul Gold Milk (500 ml)", rating: 4.0, discount: "20% OFF", price: "₹54", mrp: "₹70"),
        Product(image: "butter", tags: ["500 g", "Salted"], title: "Amul Salted Butter", rating: 4.5, discount: "18% OFF", price: "₹244", mrp: "₹299"),
        Product(image: "panner", tags: ["200 g"], title: "Amul Fresh Butter", rating: 4.3, discount: nil, price: "₹90", mrp: "₹120")
    ]

    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCard(product: product)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
