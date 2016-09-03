//
//  TestItem.swift
//  Test
//
//  Created by David Rosillo Ricardo on 3/09/16.
//  Copyright © 2016 David Rosillo Ricardo. All rights reserved.
//

import UIKit

class TestItem: NSObject, NSCoding {
    
    var todo: String?
    
    var dueDate: NSDate?
    
    var image: UIImage?
    
    override init(){
        super.init()
    }
    
    required init(coder aDecoder: NSCoder){
        super.init()
        if let message = aDecoder.decodeObjectForKey("todo") as? String {
            self.todo = message
        }
        if let date = aDecoder.decodeObjectForKey("dueDate") as? NSDate {
            self.dueDate = date
        }
        if let img = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = img
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let message = self.todo {
            aCoder.encodeObject(message, forKey: "todo")
        }
        if let date = self.dueDate {
            aCoder.encodeObject(date, forKey: "dueDate")
        }
        if let img = self.image {
            aCoder.encodeObject(img, forKey: "image")
        }
    }
    
}
