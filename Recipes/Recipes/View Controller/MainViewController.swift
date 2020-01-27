//
//  MainViewController.swift
//  Recipes
//
//  Created by FGT MAC on 1/27/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Variables
    let networkClient = RecipesNetworkClient()
    var allRecipes: [Recipe] = []{
        didSet{
            filterRecipes()
        }
    }
    
    var recipesTableViewController: RecipesTableViewController?{
        didSet{
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    var filteredRecipes: [Recipe] = [] {
        didSet{
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    
    @IBOutlet weak var searchField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        networkClient.fetchRecipes { recipes, error in
            if let error = error {
                print("Error fetching data \(error)")
                return
            }
            
            if let allRecipes = recipes {
                self.allRecipes = allRecipes
            }
        }
    }
    
    @IBAction func textField(_ sender: UITextField) {
        
        //hide keyboard
        searchField.resignFirstResponder()
        
        //get results
        filterRecipes()
    }
    
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ContainerTableViewSegue"{
            guard let ContainerVC = segue.destination as? RecipesTableViewController else { return }
            
            
            
        }
    }
    
    func filterRecipes() {
        //if field is empty display all recipes
        if searchField.text != nil {
            filteredRecipes = allRecipes
            
        } else {
            let result = allRecipes.filter { (item) -> Bool in
                return item.name == searchField.text || item.instructions == searchField.text
            }
            
            filteredRecipes = result
        }
    }
    
}
