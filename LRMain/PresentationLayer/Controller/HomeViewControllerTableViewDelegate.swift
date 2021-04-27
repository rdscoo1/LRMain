//
//  HomeViewControllerTableViewDelegate.swift
//  LRMain
//
//  Created by Roman Khodukin on 22.04.2021.
//

import UIKit

class HomeViewControllerTableViewDelegate: NSObject, UITableViewDelegate {
    
    //MARK: - Data source
    private lazy var bestPriceProducts = DataSource.getBestPriceProducts()
    private lazy var limitedOfferProducts = DataSource.getLimitedOfferProducts()
    private lazy var categories = DataSource.getCategories()
    
    private lazy var sections: [Sections] = [.categories(categories), .limitedOffer(limitedOfferProducts), .bestPrice(bestPriceProducts)]
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section] {
        case .categories:
            return 156
        case .limitedOffer:
            return 244
        case .bestPrice:
            return 244
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .categories:
            return 172
        case .limitedOffer:
            return 108
        case .bestPrice:
            return 108
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sections[section] {
        case .categories:
            let categoriesHeaderView = SearchProductsHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 172))
            return categoriesHeaderView
        case .limitedOffer:
            let productsHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 108))
            productsHeaderView.setTitle("Предложение ограничено")
            return productsHeaderView
        case .bestPrice:
            let productsHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 108))
            productsHeaderView.setTitle("Лучшая цена")
            return productsHeaderView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }
}
