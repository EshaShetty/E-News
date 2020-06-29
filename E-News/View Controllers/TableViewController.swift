//
//  TableViewController.swift
//  E-News
//
//  Created by Esha Shetty on 2020-06-29.
//  Copyright © 2020 Esha Shetty. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath)

        let label = cell.viewWithTag(2000) as! UILabel
        
        label.text = categories[indexPath.row]

        return cell
    }
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
