//
//  CocktailViewController.swift
//  Lecture17
//
//  Created by LiziChichua on 12.01.25.
//

import UIKit

class CocktailViewController: UIViewController {
    
    private var drinksManager: DrinksAPIManagerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinksManager = DrinksAPIManager()
        
        drinksManager?.fetchDrinks(with: .nonAlcoholic, completion: { result in
            switch result {
            case .success(let drinksResponse):
                print(drinksResponse)
            case .failure(let error):
                print(error)
            }
        })
    }
}

