//
//  Home.swift
//  icon
//
//  Created by WINMAC on 24/06/2023.
//

import Foundation

struct Dataa: Codable {
    let ads : [adsData]
    let services , offers : [iconData]

}
struct adsData : Codable {
    let id : Int
    let name : String
    let image : String
    let link : String
}

struct iconData : Codable {
    let id : Int
    let name : String
    let image : String
    let details : String
}






