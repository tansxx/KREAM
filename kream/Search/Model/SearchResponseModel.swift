//
//  SearchResponseModel.swift
//  kream
//
//  Created by 강희정 on 11/29/24.
//

import Foundation

struct SearchResponseModel: Codable {
    let products: [Products]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Products: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let sku: String
    let weight: Int
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let thumbnail: String
    let images: [String]
}

struct Dimensions: Codable {
    let width: Double
    let height: Double
    let depth: Double
}

struct Reviews: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
}

struct Meta: Codable {
    let createdAt: String
    let updatedAt: String
    let barcode: String
    let qrCode: String
}
