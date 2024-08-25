//
//  User.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/19/24.
//

import Foundation
import SwiftUI

struct User: Identifiable, Codable {
    let id: String
    var balance: Int
    var fullname: String
    var email: String
    var url: String?
    
    static let `default` = User(id: NSUUID().uuidString, balance: 500, fullname: "Juan Manzana", email: "alguien@email.com" )
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, balance: 50, fullname: "John Appleseed", email: "someone@email.com" )
}
