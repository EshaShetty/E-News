//
//  SavedNewsViewController.swift
//  E-News
//
//  Created by Esha Shetty on 2020-06-27.
//  Copyright © 2020 Esha Shetty. All rights reserved.
//

import UIKit
import CoreData
import SafariServices

class SavedNewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var savedArticles: [NSManagedObject] = []
    
    //variable to refresh the table
    var refreshControl = UIRefreshControl()
    
    @objc func refresh(sender:AnyObject) {
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //refreshing thre table view values
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        
        let cellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:"Article")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        //creating app delegate to access the persistent container
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                return
        }
            
        //fetching the managed context
        let managedContext = appDelegate.persistentContainer.viewContext
            
        //fetching the request : gets all the Student entities
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Article")
            
        //populates the NSManaged objects with the array of all entities
        do{
            savedArticles = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
            
    }

}

extension SavedNewsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Article", for: indexPath) as! NewsTableViewCell
        
        cell1.title.text = savedArticles[indexPath.row].value(forKeyPath: "title") as? String
        cell1.source.text = savedArticles[indexPath.row].value(forKeyPath: "source") as? String
        
        //checking if there is no image
        if(savedArticles[indexPath.row].value(forKeyPath: "image") as? Data != nil)
        {
            cell1.img.image = UIImage(data: savedArticles[indexPath.row].value(forKeyPath: "image") as! Data)
        }
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let link = savedArticles[indexPath.row].value(forKeyPath: "url") as? String
        if let url = URL(string: link!) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
       
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                        return
            }
            let managedContext = appDelegate.persistentContainer.viewContext

            managedContext.delete(savedArticles[indexPath.row])
            
            do {
                 try managedContext.save()
                 savedArticles.remove(at: indexPath.row)
                 tableView.deleteRows(at: [indexPath], with: .automatic)
                 tableView.reloadData()
            } catch let error as NSError {
                 print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
    }
    
}
