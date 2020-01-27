//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by FGT MAC on 1/27/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {

    
    //MARK: - Variables
    var recipes: [Recipe] = [] {
        //When values changes we reload the table data
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
       
        // Configure the cell...
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "DetailsSegiue" {
            
            guard let detailVC = segue.destination as? RecipeDetailViewController else { return }
            
            //get the index
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            //get the correct recipe
            let selectedRecipe = recipes[indexPath.row]
            
            //pass it to the RecipeDetailViewController
            detailVC.recipe = selectedRecipe
        
        }//if more than one segue we use a else statement here
    }

}
