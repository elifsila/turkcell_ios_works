//
//  Orders.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 12.02.2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orders = try? newJSONDecoder().decode(Orders.self, from: jsonData)

import Foundation

// MARK: - Orders
struct Orders: Codable {
    let order: [Order]
}

// MARK: - Order
struct Order: Codable {
    let durum: Bool
    let mesaj: String
}
