//
//  User.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import Foundation


struct User: Codable {
    var userId: Int?
    var orders: [Order]?
    var userFirstName: String?
    var userLastName: String?
}
