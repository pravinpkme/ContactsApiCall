//
//  ContactsApiParcer.swift
//  M.T.Task Contacts Api Call
//
//  Created by Pravin Kumar on 09/04/22.
//

import Foundation
struct ContactsParser {
    func parse(comp : @escaping ([MyData])->() ){
        let api = URL(string: "https://reqres.in/api/users?page=2")
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let ParsingData = try   JSONDecoder().decode(ApiCall.self, from: data!)
                comp(ParsingData.data)
            }catch {
                
            }
        }.resume()
        
    }
    
    
    
}

