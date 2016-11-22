//
//  CoreData.swift
//  DivewithSwift
//
//  Created by Vishwa Raj on 27/10/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import UIKit
import CoreData

class CoreData: UIViewController {

    @IBOutlet weak var primaryTextField: UITextField!
    @IBOutlet weak var optionalTextField: UITextField!
    @IBOutlet weak var delBtn: UIButton!
    @IBOutlet weak var insertBtn: UIButton!
    @IBOutlet weak var updateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionalTextField.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func insert(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue(primaryTextField.text!, forKey: "username")
        newUser.setValue(30, forKey: "age")
        newUser.setValue("Windows@10", forKey: "password")
        
        do
        {
            try context.save()
            print("Data saved")
            
        }
            
        catch
        {
            print("Error in saving data")
        }
        
        
    }
    
    @IBAction func update(_ sender: UIButton) {
        
        optionalTextField.alpha = 1
            }
    
    @IBAction func del(_ sender: UIButton) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.predicate = NSPredicate(format : "username = %@", primaryTextField.text!)
        request.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if result.value(forKey: "username") != nil
                    {
                        print("\(result) deleted")
                        context.delete(result)
                    }
                }
            }
            else
            {
                print("The data to delete could not found.")
            }
            
        }
        catch
        {
            print("Data could not be able to delete!")
        }
    }
    
    @IBAction func save(_ sender: AnyObject) {
        
        if optionalTextField.alpha == 0
        {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            request.returnsObjectsAsFaults = false
            do
            {
                let results = try context.fetch(request)
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        if let username = result.value(forKey: "username") as? String
                        {
                            print(username)
                        }
                        
                    }
                }
                else
                {
                    print("0 Result found")
                }
            }
            catch
            {
                print("Error in fetching the data!")
            }
            
        }
        else
        {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            request.returnsObjectsAsFaults = false
            request.predicate = NSPredicate(format : "username = %@", primaryTextField.text!)
            do
            {
                let results = try context.fetch(request)
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        if result.value(forKey: "username") != nil
                        {
                            result.setValue(optionalTextField.text!, forKey: "username")
                            do
                            {
                                try context.save()
                            }
                            catch
                            {
                                print("Updation failed")
                            }
                            
                        }
                    }
                }
                else
                {
                    print("The data to delete could not found.")
                }
                
            }
            catch
            {
                print("Error in requesting data!")
            }
            optionalTextField.alpha = 0

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
