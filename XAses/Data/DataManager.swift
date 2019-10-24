//
//  DataManager.swift
//  XAses
//
//  Created by Juan Manuel Moreno on 24/10/2019.
//  Copyright © 2019 Juan Manuel Moreno. All rights reserved.
//

import Foundation

protocol DataFoundation {

    func getProduct() -> Product?
    func addProduct(_ product: Product)
    func getAllProduct() -> NSMutableArray
}

class DataManager: DataFoundation {
    
    func getProduct() -> Product? {
        return nil
    }
    
    func addProduct(_ product: Product) {
    }
    
    func getAllProduct() -> NSMutableArray {
        return []
    }
}

