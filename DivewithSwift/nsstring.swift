//
//  nsstring.swift
//  DivewithSwift
//
//  Created by Vishwa Raj on 24/10/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import UIKit

class nsstring : ViewController
{
    @IBOutlet weak var testField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    @IBAction func action_test(_ sender: UIButton) {
        let b = testField.text
        print(b)
        
    }
}
