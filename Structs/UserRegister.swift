//
//  UserRegister.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userRegister = try? newJSONDecoder().decode(UserRegister.self, from: jsonData)

import Foundation

// MARK: - UserRegister
struct UserRegister: Codable {
    let us: [Us]
}

// MARK: - User
struct Us: Codable {
    let durum: Bool
    let mesaj, kullaniciID: String

    enum CodingKeys: String, CodingKey {
        case durum, mesaj
        case kullaniciID = "kullaniciId"
    }
}
