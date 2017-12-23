//
//  StoreViewController.swift
//  PrettyDog
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class StoreViewController: UIViewController {

    @IBOutlet var pickerDateTime: UIDatePicker!
    
    var location: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    @IBAction func btnLocation(_ sender: UIButton) {
        location = (sender.titleLabel?.text)!
    }
    
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Dogs", in: context)
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        
        let dateString: String = dateFormatter.string(from: self.pickerDateTime.date)
        
        object.setValue(location, forKey: "location")
        object.setValue(dateString, forKey: "day")
        
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }

        
        
    }
    
    
}
