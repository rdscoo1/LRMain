//
//  MainViewController.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

enum Sections {
    case categories([Category])
    case limitedOffer([Product])
    case bestPrice([Product])
}

class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.reuseId)
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.reuseId)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Private Properties
    
    private lazy var bestPriceProducts = DataSource.getBestPriceProducts()
    private lazy var limitedOfferProducts = DataSource.getLimitedOfferProducts()
    private lazy var categories = DataSource.getCategories()
    
    private lazy var sections: [Sections] = [.categories(categories), .limitedOffer(limitedOfferProducts), .bestPrice(bestPriceProducts)]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
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

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch sections[section] {
//        case .categories:
//            return nil
//        case .limitedOffer:
//            return "Предложение ограничено"
//        case .bestPrice:
//            return "Лучшая цена"
//        }
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sections[section] {
        case .categories:
            return nil
        case .limitedOffer:
            let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 32))
            headerView.setTitle("Предложение ограничено")
            return headerView
        case .bestPrice:
            let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 32))
            headerView.setTitle("Лучшая цена")
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
        
    }
}
