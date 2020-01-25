//
//  TableViewController.swift
//  FinalAssignment
//
//  Created by Abhinav Bhardwaj on 2020-01-24.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit
import CoreData


let appDelegate = UIApplication.shared.delegate as? AppDelegate
class TableViewController: UITableViewController {
 
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searching = false
    var productsArr:[Products] = []
    var searchArr:[Products] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        fetch()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        
        return 10
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if searching{
                cell.textLabel!.text = searchArr[10].pname![indexPath.row]
                  cell.detailTextLabel!.text = searchArr[10].pid![indexPath.row]
            
        }
        
        cell.textLabel!.text = productsArr[10].pname![indexPath.row]
        cell.detailTextLabel!.text = productsArr[10].pid![indexPath.row]

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = productsArr[10].pname![indexPath.row]
        let id =   productsArr[10].pid![indexPath.row]
        let pdesc = productsArr[10].pdesc![indexPath.row]
        let price = productsArr[10].price![indexPath.row]
        
      
      let dest = storyboard?.instantiateViewController(identifier: "viewControllerVC") as! ViewController
        
        dest.name = name
        dest.id = id
        dest.desc = pdesc
        dest.price = price
        
        
        navigationController?.pushViewController(dest, animated: true)
        
    }
    
   


    func saveData()  {
     
         guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
         
         let data = Products(context: managedContext)

         data.pname = ["Shampoo" , "Hair-Cream" , "Hair-Gel" , "Tooth-paste" , "Brush" , "Cologne" , "Conditioner" , "Soap" , "Showergel" , "Chips"]  as [String]
         data.pid = ["1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10"] as [String]
         data.pdesc = ["Anti-dandruff Shampoo" , "ecfvfv" , "wewccewc" , "wewccewc", "wewccewc", "wewccewc", "wewccewc", "wewccewc", "wewccewc"]  as [String]
         data.price = ["5$" , "6$" , "7$","7$" , "7$" , "7$" , "7$" , "7$" , "7$" , "7$"] as [String]
         
         
         
         
         do {
             
                try managedContext.save()
             
            print("saved")
            } catch  {
                print(error)
            }
            
         
         
         
     }
    
    func fetch(){
                 
                 guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
                 
                 let fetchRequest = NSFetchRequest<Products>(entityName: "Products")
                 
                 do {
                    productsArr = try managedContext.fetch(fetchRequest)
                     print("fetched successfully")
                 } catch  {
                     print(error)
                 }
                 
                 
                 
             }
    

    
}
extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArr = productsArr.filter({($0.pname![0].prefix(searchText.count)) == searchText})
        
        searching = true
        tableView.reloadData()
    }
    
    
    
}
