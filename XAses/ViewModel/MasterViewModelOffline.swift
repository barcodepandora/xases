//
//  MasterViewModelOffline.swift
//  XAses
//
//  Created by Juan Manuel Moreno on 24/10/2019.
//  Copyright © 2019 Juan Manuel Moreno. All rights reserved.
//

import Foundation

class MasterViewModelOffline: MasterViewModel {
    
    override func getAllProduct() {
        self.products = SQLiteManager.shared.getAllProduct()
        self.delegate!.refresh()
    }
    
    override func deleteProduct(product: Product) {
        SQLiteManager.shared.deleteProduct(product: product)
        self.products?.removeObject(at: self.indexForRemove!)
        print("YES")
    }
}
