//
//  ShowViewController.swift
//  Test
//
//  Created by David Rosillo Ricardo on 14/08/16.
//  Copyright © 2016 David Rosillo Ricardo. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var item: String?

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func dateSelected(sender: UIDatePicker) {
        self.dateLabel.text = formatDate(sender.date)
        toggleDatePicker()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func addImage(sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
//        This tu use camera instead of photo library
//        imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func addNotification(sender: UIBarButtonItem) {
        if let dateString = self.dateLabel.text {
            if let date = parseDate(dateString) {
                scheduleNotification(self.item!, date: date)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("item \(item)")
        self.descriptionLabel.text = item
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.addTarget(self, action: #selector(ShowViewController.toggleDatePicker))
        self.dateLabel.addGestureRecognizer(tapGestureRecognizer)
        self.dateLabel.userInteractionEnabled = true
    }
    
    func toggleDatePicker() {
//        self.imageView.hidden = self.datePicker.hidden
//        self.datePicker.hidden = !self.datePicker.hidden
        if self.datePicker.hidden {
            self.fadeInDatePicker()
        } else {
            self.fadeOutDatePicker()
        }
    }
    
    func formatDate(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter.stringFromDate(date)
    }
    
    func parseDate(string: String) -> NSDate! {
        let parser = NSDateFormatter()
        parser.dateFormat = "dd/MM/yyyy HH:mm"
        return parser.dateFromString(string)
    }
    
    func scheduleNotification(message: String, date: NSDate){
        let localNotification = UILocalNotification()
        localNotification.fireDate = date
//        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.alertBody = message
        localNotification.alertTitle = "Recuerda esta tarea: "
        localNotification.applicationIconBadgeNumber = 1
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    MARK: Animationes
    
    func fadeInDatePicker() {
        self.datePicker.alpha = 0
        self.datePicker.hidden = false
        UIView.animateWithDuration(1) { () -> Void in
            self.datePicker.alpha = 1
            self.imageView.alpha = 0
        }
    }
    
    func fadeOutDatePicker() {
        self.datePicker.alpha = 1
        self.datePicker.hidden = false
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.datePicker.alpha = 0
            self.imageView.alpha = 1
        }) { (completed) -> Void in
            if completed {
                self.datePicker.hidden = true
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    MARK: Image picker controller methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
