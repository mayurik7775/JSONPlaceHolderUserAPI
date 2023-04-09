//
//  User.swift
//  jsonPlceholderUserAPI
//
//  Created by Mac on 02/04/23.
//

import Foundation

struct User : Codable{
    var id : Int
    var name : String
    var email : String
    var phone : String
    var website : String
    var address : Address
}
struct Address : Codable{
    var street , suite , city , zipcode : String
}
