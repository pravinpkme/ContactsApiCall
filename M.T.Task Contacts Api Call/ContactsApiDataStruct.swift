//
//  ContactsApiDataStruct.swift
//  M.T.Task Contacts Api Call
//
//  Created by Pravin Kumar on 09/04/22.
//

import Foundation
struct ApiCall:  Decodable{
    let page : Int
    let data : [MyData]
    
}
struct MyData : Decodable{
    let id : Int
    let email : String
    let first_name : String
    let last_name : String
    let avatar : String
    
}
