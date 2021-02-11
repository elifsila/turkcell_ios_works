// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photosData = try? newJSONDecoder().decode(PhotosData.self, from: jsonData)

import Foundation

// MARK: - PhotosDatum
struct PhotosDatum: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias PhotosData = [PhotosDatum]
