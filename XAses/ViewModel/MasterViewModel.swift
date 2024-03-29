//
//  MasterViewModel.swift
//  XAses
//
//  Created by Juan Manuel Moreno on 24/10/2019.
//  Copyright © 2019 Juan Manuel Moreno. All rights reserved.
//

import Foundation

protocol ViewModelBehavoir {

    func getAllProduct()
    func deleteProduct(product: Product)
   
}

protocol ViewModelDelegate: class {
    
    func refresh()
}

class MasterViewModel: ViewModelBehavoir {
    
    // MARK: - Character
    
    var products: NSMutableArray?
    weak var delegate: ViewModelDelegate?
    var indexForRemove: Int?
    
    // MARK: - Protocol
    
    func getAllProduct() {
    }
    
    func deleteProduct(product: Product) {
    }
}
