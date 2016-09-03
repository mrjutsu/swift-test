//
//  ViewController.swift
//  Test
//
//  Created by David Rosillo Ricardo on 20/07/16.
//  Copyright © 2016 David Rosillo Ricardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let test = Test()
    
    var selectedItem: TestItem?
    
    static let MAX_TEXT_SIZE = 50
    
    @IBAction func addButtonPressed(sender: UIButton){
        print("se presiono el boton")
        print(itemTextField.text)
        let todoItem = TestItem()
        todoItem.todo = itemTextField.text
        test.addItem(todoItem)
        tableView.reloadData()
        self.itemTextField?.resignFirstResponder()
        self.itemTextField.text = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = test
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.itemTextField?.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.performSegueWithIdentifier("showItem", sender: self)
        self.selectedItem = self.test.getItem(indexPath.row)
//        MARK: transition when no segue is specified in storyboard
//        let showVC = ShowViewController()
//        showVC.item = self.selectedItem
//        self.navigationController?.pushViewController(showVC, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let showViewController = segue.destinationViewController as? ShowViewController {
            showViewController.item = self.selectedItem
            showViewController.test = self.test
        }
    }
    
    //MARK: Metodos del textfield delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String)->Bool {
        if let tareaString = textField.text as? NSString {
            let updatedString = tareaString.stringByReplacingCharactersInRange(range, withString: string)
            return updatedString.characters.count < ViewController.MAX_TEXT_SIZE
        } else {
            return true
        }
    }


}

