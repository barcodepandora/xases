//
//  Product.swift
//  XAses
//
//  Created by Juan Manuel Moreno on 24/10/2019.
//  Copyright © 2019 Juan Manuel Moreno. All rights reserved.
//

import Foundation

struct Product: Codable {

    // MARK: - Character

    var id: Int?
    var name: String?
    var desc: String?
    var cost: Int?
    var image: String?
    
    // MARK: - Init
    
    init() {
    }
    
    init(name: String, desc: String, cost: Int, image: String) {
        self.name = name
        self.desc = desc
        self.cost = cost
        self.image = image
    }
}
