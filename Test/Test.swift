//
//  Test.swift
//  Test
//
//  Created by David Rosillo Ricardo on 24/07/16.
//  Copyright © 2016 David Rosillo Ricardo. All rights reserved.
//

import UIKit

class Test: NSObject {
    var items: [TestItem] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    private let fileURL: NSURL = {
        let fileManager = NSFileManager.defaultManager()
        let documentDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let documentDirectoryURL = documentDirectoryURLs.first!
        print("path de documents \(documentDirectoryURL)")
        return documentDirectoryURL.URLByAppendingPathComponent("test.plist")
    }()
    
    func addItem(item: TestItem){
        items.append(item)
        saveItems()
    }
    
    func saveItems(){
        let itemsArray = items as NSArray
        if NSKeyedArchiver.archiveRootObject(itemsArray, toFile: self.fileURL.path!) {
            print ("guardado")
        } else {
            print("no guardado")
        }
//        if itemsArray.writeToURL(self.fileURL, atomically: true) {
//            print("guardado")
//        } else {
//        print("no guardado")}
    }
    
    func loadItems(){
        if let itemsArray = NSKeyedUnarchiver.unarchiveObjectWithFile(self.fileURL.path!) {
            self.items = itemsArray as! [TestItem]
        }
    }
    
    func getItem(index: Int) -> TestItem{
        return items[index]
    }
}

extension Test : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item.todo
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        items.removeAtIndex(indexPath.row)
        saveItems()
        tableView.beginUpdates()
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        tableView.endUpdates()
    }
}

