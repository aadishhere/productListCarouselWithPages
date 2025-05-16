//
//  ProductCard.swift
//  productListCarousel
//
//  Created by Aadish Jain on 16/05/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    @State private var count = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .bottomTrailing) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .background(Color(.secondarySystemBackground).opacity(0.8), in: RoundedRectangle(cornerRadius: 15))

                Group {
                    if count == 0 {
                        Button {
                            count += 1
                            print("Added \(product.title) to cart")
                        } label: {
                            Text("ADD")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.green)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 12)
                                .background(Color(.systemBackground))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.green, lineWidth: 1.5)
                                )
                                .cornerRadius(8)
                        }
                    } else {
                        HStack(spacing: 6) {
                            Button {
                                if count > 0 { count -= 1 }
                            } label: {
                                Image(systemName: "minus")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 15, height: 15)
                            }

                            Text("\(count)")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(minWidth: 15)

                            Button {
                                count += 1
                            } label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 15, height: 15)
                            }
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(Color(.green))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    }
                }
                .padding(8)
            }

            HStack {
                ForEach(product.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .background(Color(.secondarySystemBackground).opacity(0.8))
                        .cornerRadius(5)
                }
            }
            .padding(.bottom, 2)

            Text(product.title)
                .font(.caption)
                .fontWeight(.semibold)
                .lineLimit(2)
                .padding(.bottom, 2)

            HStack(spacing: 2) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption2)
                Text("\(String(format: "%.1f", product.rating))")
                    .font(.caption2)
            }
            .padding(.bottom, 4)

            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(product.price)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    if let mrp = product.mrp {
                        Text("MRP \(mrp)")
                            .strikethrough()
                            .foregroundColor(.gray)
                            .font(.caption2)
                    }
                    Spacer()
                }
                if let discount = product.discount {
                    Text(discount)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
        }
        .frame(width: 150)
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}
