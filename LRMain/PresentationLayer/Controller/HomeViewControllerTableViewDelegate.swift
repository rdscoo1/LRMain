//
//  HomeViewControllerTableViewDelegate.swift
//  LRMain
//
//  Created by Roman Khodukin on 22.04.2021.
//

import UIKit

class HomeViewControllerTableViewDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Public Properties
    
    //    private lazy var headerHeightConstraint: NSLayoutConstraint = (categoriesHeaderView?.heightAnchor.constraint(equalToConstant: 172))!
    
    // header height
    private let maxHeaderHeight: CGFloat = 224
    private let minHeaderHeight: CGFloat = 96
    private var previousScrollOffset = CGPoint.zero
    
    // MARK: - UI
    
    var categoriesHeaderView: SearchProductsHeaderView?
    
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
            categoriesHeaderView = SearchProductsHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 172))
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //ScrollView's contentOffset differences with previous contentOffset
        let contentOffset =  scrollView.contentOffset.y - previousScrollOffset.y
        
//        print(scrollView.contentOffset.y)
        
        // Scrolls UP - we compress the top view
        if contentOffset > 0 && scrollView.contentOffset.y > 0 {
            if contentOffset > 0  {
                let percentage = 47 / (scrollView.contentOffset.y * 47)
                print(percentage)
                categoriesHeaderView?.changeLayout(with: percentage)
                
                if percentage < 0.013 {
                    
                }
            } else {
                categoriesHeaderView?.alpha = 1.0
            }
            
            print("Scrolls UP")
            //                       scrollView.contentOffset.y -= contentOffset
        }
        
        // Scrolls Down - we expand the top view
        if contentOffset < 0 && scrollView.contentOffset.y < 0 {
            categoriesHeaderView?.alpha = 1.0
            print("Scrolls Down")
            //                scrollView.contentOffset.y -= contentOffset
            
        }
        previousScrollOffset = scrollView.contentOffset
        
        
        
        //        let contentOffset = scrollView.contentOffset.y
        //
        //        var percentage: CGFloat = 0
        //
        //        if contentOffset < 0 {
        //            percentage = abs(contentOffset) / 5
        //        }
        //
        //
        //
        //        print("contentOffset", contentOffset)
    }
}
