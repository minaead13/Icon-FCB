//
//  myRequestsModel.swift
//  icon
//
//  Created by WINMAC on 05/07/2023.
//

import Foundation

struct MyRequests : Codable {
    let id: Int
    let serviceID, status, createdAt: String
    let service: Service

    enum CodingKeys: String, CodingKey {
        case id
        case serviceID = "service_id"
        case status
        case createdAt = "created_at"
        case service
    }
}

// MARK: - Service
struct Service: Codable {
    let id: Int
    let image: String
    let name: String
}
