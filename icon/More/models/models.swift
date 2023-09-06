//
//  models.swift
//  icon
//
//  Created by WINMAC on 02/07/2023.
//

import Foundation

struct contactUs: Codable {
    let userID: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case id
    }
}
