//
//  CocktailViewController.swift
//  Lecture17
//
//  Created by LiziChichua on 12.01.25.
//

import UIKit

class CocktailViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Properties
    private var drinksManager: DrinksAPIManagerProtocol?
    private var drinks: [Drink] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDrinks()
        setupTableView()
    }
    
    // MARK: IBActions
    @IBAction func didTapDrinkType(_ sender: UISegmentedControl) {
        guard let type = DrinkType(rawValue: sender.selectedSegmentIndex) else { return }
        fetchDrinks(with: type)
    }
    
    // MARK: Methods
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: "DrinkTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DrinkTableViewCell"
        )
    }
    
    private func fetchDrinks(with type: DrinkType = .alcoholic) {
        drinksManager = DrinksAPIManager()
        
        drinksManager?.fetchDrinks(with: type, completion: { result in
            switch result {
            case .success(let drinksResponse):
                self.drinks = drinksResponse.drinks
            case .failure(let error):
                print(error)
            }
        })
    }
}

// MARK: - UITableViewDataSource
extension CocktailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkTableViewCell", for: indexPath) as? DrinkTableViewCell
        cell?.configure(with: drinks[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
