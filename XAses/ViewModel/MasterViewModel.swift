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
   
}

protocol ViewModelDelegate: class {
    
//    func showMocky(_ mocky: Mocky)
//    func tellAllFactor()
    func refresh()
}

class MasterViewModel: ViewModelBehavoir {
    
    // MARK: - Character
    
//    var mocky: Mocky?
//    var factorForBakin = 0
    var products: NSMutableArray?
    weak var delegate: ViewModelDelegate?
    
    // MARK: - Protocol
    
    func getAllProduct() {
    }
    
//    func getMocky() {}
//
//    func saveMocky(_ mocky: Mocky) {}
//
//    func checkAllFactor() {
//        if self.factorForBakin == self.mocky?.topping?.count {
//            self.delegate?.tellAllFactor()
//        }
//    }
//
//    func checkFactor() {
//        self.factorForBakin = self.factorForBakin + 1
//    }
//
//    func uncheckFactor() {
//        self.factorForBakin = self.factorForBakin - 1
//    }
//
//    func addFactor(_ factor: Factor) {
//        self.mocky?.topping?.append(factor)
//    }
//
//    func removeFactor(_ factorId: Int) {
//        self.mocky?.topping?.remove(at: factorId)
//    }
}
