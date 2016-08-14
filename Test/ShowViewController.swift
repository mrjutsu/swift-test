//
//  ShowViewController.swift
//  Test
//
//  Created by David Rosillo Ricardo on 14/08/16.
//  Copyright © 2016 David Rosillo Ricardo. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    var item: String?

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("item \(item)")
        self.descriptionLabel = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
