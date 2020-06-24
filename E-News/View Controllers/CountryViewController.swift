//
//  CountryViewController.swift
//  E-News
//
//  Created by Esha Shetty on 2020-06-24.
//  Copyright © 2020 Esha Shetty. All rights reserved.
//

import UIKit

//creating a delegate to send data from country list to the converter
protocol CountryViewControllerDelegate: class {
    func countryViewControllerSelect(_ controller: CountryViewController, didFinishAdding countryCode: String)
}

class CountryViewController: UITableViewController {
    
    
    let countries = ["United Arab Emirates","Argentina","Austria","Australia","Belgium","Bulgaria","Brazil","Canada","Switzerland","China","Colombia","Cuba","Czech Republic","Germany","Eqypt","France","United Kingdom","Greece","Hong Kong","Hungary","Indonesia","Ireland","Israel","India","Italy","Japan","Korea","Lithuania", "Latvia","Morocco","Mexico","Malaysia","Nigeria","Netherlands","Norway", "New Zeland","Philippines", "Poland","Portugal","Romania","Serbia","Russia","Saudi Arabia","Sweden","Singapore","Slovenia","Slovakia", "Thailand","Turkey","Taiwan","Ukraine","United States of America","Venezuela","South Africa" ]
    
    let countryCode = ["ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "cz", "de", "eg", "fr", "gb", "gr", "hk", "hu", "id", "ie", "il", "in", "it", "jp", "kr", "lt", "lv", "ma", "mx", "my", "ng", "nl", "no", "nz", "ph", "pl", "pt", "ro", "rs", "ru", "sa", "se", "sg", "si", "sk", "th", "tr", "tw", "ua", "us", "ve", "za"]
    
    
    weak var delegate: CountryViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = countries[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.countryViewControllerSelect(self,didFinishAdding: countryCode[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.popViewController(animated: true)
    }
    

}
