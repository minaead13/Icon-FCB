//
//  countriesModel.swift
//  icon
//
//  Created by WINMAC on 08/07/2023.
//

import Foundation

struct countries : Codable {
    let id: Int
    let name: String
}


struct UpdateProfile: Codable {
    let id: Int
    let firstName, middleName, lastName: String
    let countryCode, phone, email: String
    let gender: String
    let jwt: String
    let image: String
    let password: String
   
    let type, status, createdAt, updatedAt: String
    let birthDay, nationalityID, countryID, cityID: String
    let address1, address2, empName, jobTitle: String
    let jobDate, salary: String
    let country, city, nationality: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case countryCode = "country_code"
        case phone, email, gender, jwt, image, password
       
        case type, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case birthDay = "birth_day"
        case nationalityID = "nationality_id"
        case countryID = "country_id"
        case cityID = "city_id"
        case address1, address2
        case empName = "emp_name"
        case jobTitle = "job_title"
        case jobDate = "job_date"
        case salary, country, city, nationality
    }
}
