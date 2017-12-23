//
//  CutViewController.swift
//  PrettyDog
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class CutViewController: UIViewController {

    @IBOutlet var stylePart: UIButton!
    @IBOutlet var styleAll: UIButton!
    @IBOutlet var styleTeddy: UIButton!
    @IBOutlet var styleBroccoli: UIButton!
    @IBOutlet var styleFull: UIButton!
    @IBOutlet var styleSummer: UIButton!
    
    var selectedStyle: String = " "
    var selectedPrice: String = " "
    
//    var strName:String?
//    var strBirth:String?
//    var strSex:String?
//    var strNeutralization:String?
//    var strWeight:String?
    
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

    @IBAction func btnStyle(_ sender: UIButton) {
    
        if sender == styleAll{
            selectedStyle = "전체미용"
            selectedPrice = "30,000원"
        }else if sender == stylePart{
            selectedStyle = "부분미용"
            selectedPrice = "15,000원"
        }else if sender == styleTeddy{
            selectedStyle = "테디베어"
            selectedPrice = "50,000원"
        }else if sender == styleBroccoli{
            selectedStyle = "브로콜리"
            selectedPrice = "50,000원"
        }else if sender == styleFull{
            selectedStyle = "풀콧미용"
            selectedPrice = "40,000원"
        }else if sender == styleSummer{
            selectedStyle = "썸머-컷"
            selectedPrice = "30,000원"
        }
    }
    
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Dogs", in: context)
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(selectedStyle, forKey: "cutType")
        object.setValue(selectedPrice, forKey: "price")
//        object.setValue(strName, forKey: "name")
//        object.setValue(strBirth, forKey: "birth")
//        object.setValue(strSex, forKey: "sex")
//        object.setValue(strNeutralization, forKey: "neutralization")
//        object.setValue(strWeight, forKey: "weight")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
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
