//
//  InfoViewController.swift
//  PrettyDog
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class InfoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtBirth: UITextField!
    @IBOutlet var segSex: UISegmentedControl!
    @IBOutlet var segNeutralization: UISegmentedControl!
    @IBOutlet var txtWeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("출발")
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        print("시작")
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Dogs", in: context)
       
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(txtName.text, forKey: "name")
        object.setValue(txtBirth.text, forKey: "birth")
        object.setValue(segSex.titleForSegment(at: segSex.selectedSegmentIndex), forKey: "sex")
        object.setValue(segNeutralization.titleForSegment(at: segNeutralization.selectedSegmentIndex), forKey: "neutralization")
        object.setValue(txtWeight.text, forKey: "weight")
        
        do {
            try context.save()
            print("좋아")
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
             print("안좋아")
        }
//

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toCutView" {
//            if let destination = segue.destination as? CutViewController {
//                destination.strName = txtName.text
//                destination.strSex = segSex.titleForSegment(at: segSex.selectedSegmentIndex)
//                destination.strBirth = txtBirth.text
//                destination.strNeutralization = segNeutralization.titleForSegment(at: segNeutralization.selectedSegmentIndex)
//                destination.strWeight = txtWeight.text
//            }
//        }
//    }
}
