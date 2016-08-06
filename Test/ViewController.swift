//
//  ViewController.swift
//  Test
//
//  Created by David Rosillo Ricardo on 20/07/16.
//  Copyright © 2016 David Rosillo Ricardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let test = Test()
    
    @IBAction func addButtonPressed(sender: UIButton){
        print("se presiono el boton")
        print(itemTextField.text)
        test.addItem(itemTextField.text!)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = test
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

