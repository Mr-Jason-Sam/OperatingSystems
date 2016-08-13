//
//  DrawCharacter.swift
//  Operating_Systems2.0
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 null. All rights reserved.
//

import Cocoa

var context:CGContext!

class DrawCharacter: NSView {
    
    override func awakeFromNib() {
        drawSize  = CGSize(width: 8,height: 16)
    }
    
    var drawSize : CGSize!
    var drawPoint: CGPoint!
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        context = (NSGraphicsContext.currentContext()?.CGContext)!
        // Drawing code here.
    }
    
}
