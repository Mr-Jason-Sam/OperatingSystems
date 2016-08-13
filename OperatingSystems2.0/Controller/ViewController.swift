//
//  ViewController.swift
//  Operating_Systems 2.0
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 null. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var drawView: DrawCharacter!
    
    var bitmapData : BitmapData!
    var commandInfo: CommandInfo!
    
    
    let WIDTH  = 8
    let HEIGHT = 16
    let carriageReturnRun = CommandInfo()
    
    var mCharNum = 0
    var command: [String] = []
    var information = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bitmapData = BitmapData(width: WIDTH,height: HEIGHT)
        commandInfo = CommandInfo()
        //drawView.addTra
        
        
        NSEvent.addLocalMonitorForEventsMatchingMask(.KeyDownMask) { (aEvent) -> NSEvent! in
            self.keyDown(aEvent)
            return aEvent
        }
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func deleteOperation(charNum: Int) -> Int{
        if charNum > 0 {
            command.removeLast()
            drawCharacter("",charNum: charNum - 1)
            drawView.displayIfNeeded()
            return charNum - 1
        }
        return 0
    }
    
    
    
    func returnOperation(){
        carriageReturnRun.runCommand()
    }
    
    func normalOperation(charNum: Int,character: String) -> Int{
        drawCharacter(character,charNum: charNum)
        drawView.displayIfNeeded()
        command.append(character)
        return charNum + 1
    }
    
    var operations: Dictionary<String,Operation> = [
        String(Character(UnicodeScalar(127))) : Operation.Delete,
        String(Character(UnicodeScalar(13)))  :Operation.Return,
    ]
    
    enum Operation {
        case Delete
        case Return
    }
    
    override func keyDown(theEvent: NSEvent) {
        super.keyDown(theEvent)
        let character = theEvent.characters!
        
        if let operation = operations[character] {
            switch operation {
            case .Delete:
                mCharNum = deleteOperation(mCharNum)
            case .Return:
                returnOperation()
            }
        }else{
            mCharNum = normalOperation(mCharNum, character: character)
        }

        information.removeAll()
        for value in command {
            information.appendContentsOf(value)
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("information",
                                                                  object: self,
                                                                  userInfo: ["info":information])
    }
    
    
    func drawCharacter(character: String,charNum: Int){
        let bitmap = bitmapData.initBitmap()
        let data = bitmapData.dataChange(character)
        drawPixel(bitmap,context: context,data: data,characterNum: charNum)
    }
    
    //Draw pixel on the screen
    func drawPixel(bitmap: CGContext,context: CGContext,data: UnsafeMutablePointer<Int32>,characterNum :Int){
        let bitmapData = UnsafeMutablePointer<UInt32>(CGBitmapContextGetData(bitmap))
        
        //self.frame.origin.y + (myView.frame.size.height / 2))
        var mY:Int = Int(drawView.frame.size.height) - 30
        
        let mX:Int = characterNum * 8
        var row = 15
        while row >= 0 {
            for column in 0 ..< 8 {
                if data[row * 8 + column] == 1 {
                    //Font color is black
                    bitmapData[column] = 0xff000000
                }
                else{
                    bitmapData[column] = 0xffE7E7E7
                }
            }
            
            //Set pixel to image
            let imageRef = CGBitmapContextCreateImage(bitmap)
            
            //Show image in screen
            CGContextDrawImage(context, CGRect(x :mX,y :mY ,width: Int(drawView.drawSize.width),height: Int(drawView.drawSize.height)), imageRef)
            
            //Change next line
            mY  += 1
            row -= 1
        }
    }



}








