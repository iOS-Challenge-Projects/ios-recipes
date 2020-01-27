//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by FGT MAC on 1/27/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsTextField: UITextView!
    
    
    var recipe: Recipe? {
        didSet{
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    
    func updateViews(){
        //if the view loaded then we attampt to set the data
        if isViewLoaded {
            
             //Unwrap recipe
            if let recipe = recipe {
                titleLabel.text = recipe.name
                detailsTextField.text = recipe.instructions
            }
        }
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
