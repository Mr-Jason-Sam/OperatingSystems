//
//  CommandInfo.swift
//  OperatingSystems2.0
//
//  Created by apple on 16/8/9.
//  Copyright © 2016年 null. All rights reserved.
//

import Cocoa

class CommandInfo: NSObject {
    
    var info:String!
    var command:String = ""
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(self.information(_:)),
                                                        name: "information", object: nil)
        command.removeAll()
    }
    
    func information(notification: NSNotification) {
        command = notification.userInfo!["info"] as! String!
    }
    
    func runCommand(){
        //print(command)
        if command == "run" {
            
            let run = RunCommand()
            run.check()
            
        }
    }
    

    
    
    
}
