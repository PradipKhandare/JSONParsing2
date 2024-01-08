//
//  PersonDataModel.swift
//  JSONParsing2
//
//  Created by NTS on 08/01/24.
//

import Foundation

struct PersonDataModel: Codable
{
    let firstName : String
    let lastName : String
    let gender :  String
    let age : Int
    
    init(firstName: String, lastName: String, gender: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.age = age
    }
}
