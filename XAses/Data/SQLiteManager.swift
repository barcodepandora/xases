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
        return nil
    }
    
    override func addProduct(_ product: Product) {
        SQLiteManager.getInstance().database!.open()
        let isInserted = SQLiteManager.getInstance().database!.executeUpdate("INSERT INTO Product (name, desc, cost, image) VALUES (?, ?, ?, ?)", withArgumentsIn: [product.name, product.desc, product.cost, product.image])
        SQLiteManager.getInstance().database!.close()
    }
    
    override  func getAllProduct() -> NSMutableArray {
        SQLiteManager.getInstance().manageTable()
        SQLiteManager.getInstance().database!.open()
        let resultSet: FMResultSet! = SQLiteManager.shared.database!.executeQuery("SELECT * FROM Product", withArgumentsIn: [])
        let all : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                var product: Product = Product()
                product.id = Int(resultSet.int (forColumn: "id"))
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
        SQLiteManager.getInstance().database!.open()
        let sql_stmt = "CREATE TABLE Product (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, desc TEXT, cost INTEGER, image TEXT)"
        let create = SQLiteManager.getInstance().database!.executeStatements(sql_stmt)
        SQLiteManager.getInstance().database!.close()
        if !(create) {
            print("error create: \(SQLiteManager.getInstance().database!.lastErrorMessage())")
        } else {
            if let urlPath = Bundle.main.url(forResource: "Products", withExtension: "json") {
                do {
                    let jsonData = try Data(contentsOf: urlPath, options: .mappedIfSafe)
                    if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: AnyObject] {
                        if let products: NSArray = jsonDict["products"] as! NSArray {
                            for p in products {
                                print("\(p)")
                                self.addProduct(Product(name: (p as! NSDictionary)["name"] as! String, desc: (p as! NSDictionary)["desc"] as! String, cost: (p as! NSDictionary)["cost"] as! Int, image: (p as! NSDictionary)["image"] as! String))
                            }
                        }
                    }
                }
                catch let jsonError {
                    print(jsonError)
                }
            }
        }
    }
    
    override func deleteProduct(product: Product) {
        SQLiteManager.getInstance().database!.open()
        let isDeleted = SQLiteManager.getInstance().database!.executeUpdate("DELETE FROM Product WHERE id=?", withArgumentsIn: [product.id])
        SQLiteManager.getInstance().database!.close()
    }
    
}


