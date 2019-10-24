//
//  SQLiteManager.swift
//  XAses
//
//  Created by Juan Manuel Moreno on 24/10/2019.
//  Copyright © 2019 Juan Manuel Moreno. All rights reserved.
//

import Foundation

class SQLiteManager: DataManager {
    
    // MARK: - Shared
    
    static let shared = SQLiteManager()
    var database: FMDatabase? = nil
    
    class func getInstance() -> SQLiteManager
    {
        if(shared.database == nil)
        {
            shared.database = FMDatabase(path: SQLiteUtil.getPath(fileName: "Ases.db"))
        }
        return shared
    }

    // MARK: - Init
    
    override init() {
        super.init()
    }
    
    // MARK: - Cache
    
    override func getProduct() -> Product? {
//        var mocky: Mocky?
//        do {
//            let mocky = try Disk.retrieve("0001", from: .documents, as: Mocky.self)
//        } catch {
//            print("Unexpected error: \(error).")
//        }
//        return mocky
        return nil
    }
    
    override func addProduct(_ product: Product) {
//        print("-> \(SQLiteUtil.getPath(fileName: "Ases.db"))")
        SQLiteManager.getInstance().database!.open()
        self.manageTable()
        let isInserted = SQLiteManager.getInstance().database!.executeUpdate("INSERT INTO Product (name, desc, cost, image) VALUES (?, ?, ?, ?)", withArgumentsIn: [product.name, product.desc, product.cost, product.image])
        
        SQLiteManager.getInstance().database!.close()
//        return isInserted
    }
    
    override  func getAllProduct() -> NSMutableArray {
        SQLiteManager.getInstance().database!.open()
        let resultSet: FMResultSet! = SQLiteManager.shared.database!.executeQuery("SELECT * FROM Product", withArgumentsIn: [])
        let all : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                var product: Product = Product()
                product.name = resultSet.string(forColumn: "name")
                product.desc = resultSet.string(forColumn: "desc")
                product.cost = Int(resultSet.int (forColumn: "cost"))
                product.image = resultSet.string(forColumn: "image")
                all.add(product)
            }
        }
        SQLiteManager.getInstance().database!.close()
        return all
    }

    
    func manageTable() {
        let sql_stmt = "CREATE TABLE IF NOT EXISTS Product (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, desc TEXT, cost INTEGER, image TEXT)"
        if !(SQLiteManager.getInstance().database!.executeStatements(sql_stmt)) {
            print("Error: \(SQLiteManager.getInstance().database!.lastErrorMessage())")
        }
    }
}


