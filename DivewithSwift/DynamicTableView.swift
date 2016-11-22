//
//  DynamicTableView.swift
//  DivewithSwift
//
//  Created by Vishwa Raj on 24/10/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import UIKit

class DynamicTableView : UITableViewController
{
    var a = ["a", "b", "c"];
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return a.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        cell?.textLabel?.text = a[indexPath.row]
        return cell!
        
    }
}
