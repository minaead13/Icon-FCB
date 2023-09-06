//
//  AboutModel.swift
//  icon
//
//  Created by WINMAC on 25/06/2023.
//

import Foundation

struct Dataaa : Codable {
    let about : About
    let vision : About
    let mission : About
    let values : About
}

struct About : Codable {
    let id : Int
    let name : String
    let details : String
}

//struct Vision : Codable {
//    let id : Int
//    let name : String
//    let details : String
//}
