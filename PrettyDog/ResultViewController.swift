//
//  ResultViewController.swift
//  PrettyDog
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class ResultViewController: UIViewController {
    @IBOutlet var resultName: UILabel!
    @IBOutlet var resultBirth: UILabel!
    @IBOutlet var resultSex: UILabel!
    @IBOutlet var resultNeutralization: UILabel!
    @IBOutlet var resultWeight: UILabel!
    @IBOutlet var resultCutType: UILabel!
    @IBOutlet var resultLocation: UILabel!
    @IBOutlet var resultDay: UILabel!
    @IBOutlet var resultPrice: UILabel!

    var detailDog: NSManagedObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let detail = detailDog {
            resultName.text = detail.value(forKey: "name") as? String
            resultBirth.text = detail.value(forKey: "birth") as? String
           
            resultSex.text = detail.value(forKey: "sex") as? String
            resultNeutralization.text = detail.value(forKey: "neutralization") as? String
            resultWeight.text = detail.value(forKey: "weight") as? String
            
            resultCutType.text = detail.value(forKey: "cutType") as? String
            
            resultLocation.text = detail.value(forKey: "location") as? String
            
            resultDay.text = detail.value(forKey: "day") as? String
            
            resultPrice.text = detail.value(forKey: "price") as? String
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
