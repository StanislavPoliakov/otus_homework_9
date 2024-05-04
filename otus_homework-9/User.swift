//
//  User.swift
//  otus_homework-9
//
//  Created by Поляков Станислав Денисович on 04.05.2024.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let jobTitle: String
    let address: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
