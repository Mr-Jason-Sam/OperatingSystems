//
//  RunCommand1.swift
//  OperatingSystems2.0
//
//  Created by apple on 16/8/10.
//  Copyright © 2016年 null. All rights reserved.
//

import Cocoa

class RunCommand: NSObject {
    let KEY_WORD = "display"
    
    //let fileManage = NSFileManager.defaultManager()
    
    let path = "/Users/apple/Desktop/test.txt"
    
    
    internal func check() {
        let data = NSData(contentsOfFile:path)
        let fileData = String(data: data!, encoding: NSUTF8StringEncoding)
        if fileData!.hasPrefix(KEY_WORD) {
            operation((fileData?.componentsSeparatedByString(KEY_WORD).last)!)
        }
    }
    
    func operation(content: String) {
        let charset=NSCharacterSet(charactersInString:"(\")")
        let displayContent = content.stringByTrimmingCharactersInSet(charset)
        print(displayContent)
    }
}
