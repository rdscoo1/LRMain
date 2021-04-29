//
//  HomeViewControllerTableViewDataSource.swift
//  LRMain
//
//  Created by Roman Khodukin on 22.04.2021.
//

import UIKit

class HomeViewControllerTableViewDataSource: NSObject, UITableViewDataSource {
    
    //MARK: - Data source
    
    private lazy var bestPriceProducts = DataSource.getBestPriceProducts()
    private lazy var limitedOfferProducts = DataSource.getLimitedOfferProducts()
    private lazy var categories = DataSource.getCategories()
    
    private lazy var sections: [Sections] = [.categories(categories), .limitedOffer(limitedOfferProducts), .bestPrice(bestPriceProducts)]
    
    // MARK: - TableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .categories(let items):
            guard let categoriesCell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.reuseId, for: indexPath) as? CategoriesTableViewCell
            else {
                fatalError("Expected cell with reuse identifier: \(CategoriesTableViewCell.reuseId)")
            }
            
            categoriesCell.categories = items
            
            return categoriesCell
        case .bestPrice(let items):
            guard let bestPriceCell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.reuseId, for: indexPath) as? ProductsTableViewCell
            else {
                fatalError("Expected cell with reuse identifier: \(ProductsTableViewCell.reuseId)")
            }
            
            bestPriceCell.products = items
            
            return bestPriceCell
        case .limitedOffer(let items):
            guard let limitedOfferCell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.reuseId, for: indexPath) as? ProductsTableViewCell
            else {
                fatalError("Expected cell with reuse identifier: \(ProductsTableViewCell.reuseId)")
            }
            
            limitedOfferCell.products = items
            
            return limitedOfferCell
        }
    }
}
