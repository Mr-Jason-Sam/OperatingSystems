//
//  BitmapData.swift
//  Operating_Systems 2.0
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 null. All rights reserved.
//

import Cocoa

class BitmapData: NSObject {

    private var mWidth:  Int!
    private var mHeight: Int!
    private let fontFilePath = "/Users/apple/Desktop/HolidayTrain/OperatingSystems2.0/OperatingSystems2.0/SupportFiles/tool/ASC16"
    
    
    init(width: Int,height: Int) {
        super.init()
        mWidth  = width
        mHeight = height
        
    }
    
    func initBitmap() -> CGContext {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.ByteOrder32Big.rawValue | CGImageAlphaInfo.PremultipliedLast.rawValue)
        
        let bitmap = CGBitmapContextCreate(nil,mWidth , mHeight, 8, 0, colorSpace,bitmapInfo.rawValue)
        
        return (bitmap)!
    }
    
    // Change swift into c
    func dataChange(sigleString:String) -> UnsafeMutablePointer<Int32> {
        //Change swift String into c char
        let character = (sigleString.cStringUsingEncoding(NSUTF8StringEncoding)?.first)! as CChar
        
        //Change swift String into c char*
        let path = (fontFilePath.cStringUsingEncoding(NSUTF8StringEncoding))!
        let pPath = UnsafeMutablePointer <Int8>(path)
        
        //Pass c bitmap date to swift UnsafeMutablePointer<Int8>
        let data = bitmapDate(character,pPath)
        
        return data
    }
    
    
    
}
