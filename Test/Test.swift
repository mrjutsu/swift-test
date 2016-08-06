//
//  Test.swift
//  Test
//
//  Created by David Rosillo Ricardo on 24/07/16.
//  Copyright © 2016 David Rosillo Ricardo. All rights reserved.
//

import UIKit

class Test: NSObject {
    var items: [String] = []
    func addItem(item: String){
        items.append(item)
    }
}

extension Test : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        return cell
    }
}

