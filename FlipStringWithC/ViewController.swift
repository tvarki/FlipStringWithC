//
//  ViewController.swift
//  ExpandStringWithC
//
//  Created by Дмитрий Яковлев on 14.07.2020.
//  Copyright © 2020 Дмитрий Яковлев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        
        
    }
    @IBAction func flipClicked(_ sender: Any) {
           let str = "qwerty"
        //        var array: [UInt8] = Array(str.utf8)
        //        let stringPointer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
        //        stringPointer.initialize(from: &array, count: array.count)
        //        guard let res = flipString(stringPointer, Int32(array.count)) else {return}
        //        let tmp = res.pointee
        //        print(tmp)
        //        let p = res+1
        //        print(p.pointee)
                
                print(str)
                guard let tmp = flip(str: str) else {return}
                print(tmp)
                guard let tmp2 = flip(str: tmp) else {return}
                print(tmp2)
    }
    
    func flip(str:String)->String?{
        
        var array: [UInt8] = Array(str.utf8)
        let stringPointer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
        stringPointer.initialize(from: &array, count: array.count)
        
        let structPointer = flipStringToStruct(stringPointer, Int32(array.count))
        guard structPointer != nil else{return nil}
        let tmp = structPointer!.pointee
        let res = Data(bytes: tmp.result, count: Int(tmp.resultSize))
        let resStr = String(decoding: res, as: UTF8.self)
        freeMemmory(tmp.result)
        freeSMemmory(structPointer)
        return resStr
    }
    
    
}

