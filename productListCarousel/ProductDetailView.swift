//
//  ProductDetailView\.swift
//  productListCarousel
//
//  Created by Aadish Jain on 16/05/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.top)
                    
                    HStack(spacing: 8) {
                        ForEach(product.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.caption2)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                                .background(Color(.secondarySystemBackground).opacity(0.8))
                                .cornerRadius(5)
                        }
                    }
                    
                    Text(product.title)
                        .font(.title3.bold())
                        .lineLimit(nil)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", product.rating))
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Text(product.price)
                                .font(.title2.bold())
                            if let mrp = product.mrp {
                                Text("MRP \(mrp)")
                                    .strikethrough()
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }
                        if let discount = product.discount {
                            Text(discount)
                                .font(.caption)
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Product Description")
                            .font(.headline)
                        Text("This is a placeholder description for \(product.title). It provides detailed information about ingredients, benefits, and usage.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    // Manufacturer / Company Info
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Manufactured By")
                            .font(.headline)
                        Text("This is a placeholder description for \(product.title). It provides detailed information about Manufacturing Company.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text("\(product.price)")
                            .font(.title3.bold())
                            .foregroundColor(.primary)
                        
                        if let discount = product.discount {
                            Text(discount)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color(.secondarySystemBackground).opacity(0.8))
                                .cornerRadius(4)
                        }
                    }
                    
                    Text("Inclusive of all taxes")
                        .font(.caption)
                        .foregroundColor(.primary.opacity(0.8))
                }
                
                Spacer()
                
                Group {
                    if count == 0 {
                        Button {
                            count += 1
                            print("Added \(product.title) to cart")
                        } label: {
                            Text("Add to Cart")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.green)
                                .cornerRadius(12)
                        }
                    } else {
                        HStack(spacing: 16) {
                            Button {
                                if count > 0 { count -= 1 }
                            } label: {
                                Image(systemName: "minus")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            
                            Text("\(count)")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(minWidth: 20)
                            
                            Button {
                                count += 1
                            } label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
    }
}
