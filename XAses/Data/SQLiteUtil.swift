//
//  SQLiteUtil.swift
//  XAses
//
//  Created by Juan Manuel Moreno on 24/10/2019.
//  Copyright © 2019 Juan Manuel Moreno. All rights reserved.
//

import Foundation
import UIKit

class SQLiteUtil: NSObject {
    
    class func getPath(fileName: String) -> String {
        
        do {
            let documentsURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentsURL.appendingPathComponent(fileName as String)
            
            return fileURL.path
        } catch {
            print(error.localizedDescription)
            return ""
        }

    }
    
    class func copyFile(fileName: NSString) {
        let dbPath: String = getPath(fileName: fileName as String)
        print("\(dbPath)")
        let fileManager = FileManager.default
    }
}
