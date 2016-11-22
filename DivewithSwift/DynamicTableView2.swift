//
//  DynamicTableView2.swift
//  DivewithSwift
//
//  Created by Vishwa Raj on 24/10/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import UIKit

class DynamicTableView2 : UITableViewController
{
    let myFriends = ["Vivek", "Anand", "Akanksha", "Aanand", "Vijay"];
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
      
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = myFriends[row]
        return cell
    }
    
    
}
