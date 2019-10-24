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
        
//        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let fileURL = documentsURL.appendingPathComponent(fileName)
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
        let fileManager = FileManager.default
//        if !fileManager.fileExists(atPath: dbPath) {

//            let documentsURL = Bundle.main.resourceURL
//            let fromPath = documentsURL!.appendingPathComponent(fileName as String)
//
//            var error : NSError?
//            do {
//                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
//            } catch let error1 as NSError {
//                error = error1
//            }
//            if (error != nil) {
//                print("KO \(error?.localizedDescription)")
//            } else {
//                print("OK")
//            }
//        }
    }
//
//    class func invokeAlertMethod(strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
//        let alert: UIAlertView = UIAlertView()
//        alert.message = strBody as String
//        alert.title = strTitle as String
//        alert.delegate = delegate
//        alert.addButtonWithTitle("Ok")
//        alert.show()
//    }
   
}
