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
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.addTopBounceAreaView(color: Constants.Colors.green)
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
        view.backgroundColor = Constants.Colors.green
        
        setupLayout()
        addTopBounceAreaView()
    }
    
    
    
    // MARK: - Private Methods
    
//    background color for the top of a UITableView
    private func addTopBounceAreaView() {
        var frame = UIScreen.main.bounds
        frame.origin.y = -frame.size.height

        let view = UIView(frame: frame)
        view.backgroundColor = Constants.Colors.green
        
        tableView.addSubview(view)
    }
    
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .categories:
            return 224
        case .limitedOffer:
            return 64
        case .bestPrice:
            return 64
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sections[section] {
        case .categories:
            let categoriesHeaderView = SearchProductsHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 218))
            return categoriesHeaderView
        case .limitedOffer:
            let productsHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 32))
            productsHeaderView.setTitle("Предложение ограничено")
            return productsHeaderView
        case .bestPrice:
            let productsHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 32))
            productsHeaderView.setTitle("Лучшая цена")
            return productsHeaderView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 192
        
    }
}
