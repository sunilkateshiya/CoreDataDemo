//
//  ViewController.swift
//  TEMP_COREDATA
//
//  Created by iFlame on 6/29/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        saveDataInCoreData()
        getDataFromCoreData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveDataInCoreData() {
        
        let objManageContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let obj = Employee(context: objManageContext)
        
        obj.firstname = "Irfan"
        obj.lastname = "Pathan"
        obj.salary = 150000
        
        do {
            try objManageContext.save()
        } catch {
            print(error)
        }
    }
    
    func getDataFromCoreData() {
        
        let objManageContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        //fetchReq.predicate = NSPredicate.init(format: "age == %d", 30)
        
        do {
            if let tweetUserData = try objManageContext.fetch(fetchReq) as? [Employee] {
                //print("\n[NSFetchRequestResult]\n",tweetUserData)
                for obj in tweetUserData {
                    print("Name ==> ",obj.firstname)
                }
                
                //ForDelete
                objManageContext.delete(tweetUserData[0])
                try objManageContext.save()
            }
            
        } catch {
            print(error)
        }
    }
}

