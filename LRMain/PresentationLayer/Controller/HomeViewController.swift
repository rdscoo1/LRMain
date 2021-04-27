//
//  HomeViewController.swift
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

class HomeViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CategoriesTableViewCell.self,
                           forCellReuseIdentifier: CategoriesTableViewCell.reuseId)
        tableView.register(ProductsTableViewCell.self,
                           forCellReuseIdentifier: ProductsTableViewCell.reuseId)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = Constants.Colors.green
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        return tableView
    }()
    
    private var refreshControl: UIRefreshControl?
    
    private lazy var tableViewDataSource = HomeViewControllerTableViewDataSource()
    private lazy var tableViewDelegate = HomeViewControllerTableViewDelegate()
    
    // MARK: - Private Properties
    
    private var headerHeightConstraint: NSLayoutConstraint!
    
    // header height
    private let maxHeaderHeight: CGFloat = 224
    private let minHeaderHeight: CGFloat = 96
    private var previousScrollOffset: CGFloat = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.green
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        let bigFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 1000))
        bigFooterView.backgroundColor = UIColor.white
        bigFooterView.isOpaque = true
        tableView.tableFooterView?.addSubview(bigFooterView)
        
        setupLayout()
        setupDismissKeyboard()
    }
    
    // MARK: - Private Methods
    
    //    ❗️❗️❗️
    //    let newStatusBarStyle: UIStatusBarStyle = percentage < 0.5 ? .lightContent : .default
    //            if UIApplication.shared.statusBarStyle != newStatusBarStyle { UIApplication.shared.statusBarStyle = newStatusBarStyle }
    
    private func setupLayout() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .white
        refreshControl?.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        view.addSubview(tableView)
        
//        headerHeightConstraint = searchProductsHeaderView.heightAnchor.constraint(equalToConstant: maxHeaderHeight)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func refresh(sender:AnyObject) {
        refreshControl?.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.refreshControl?.endRefreshing()
        }
    }
    
    private func setupDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        tableView.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        tableView.endEditing(true)
    }
}

//MARK: - Header logic

extension HomeViewController {
    private func canAnimateHeader(_ scrollView: UIScrollView) -> Bool {
        // Calculate height of the scroll view when the header view collapses to min height
        let scrollViewMaxHeight = scrollView.frame.height + headerHeightConstraint.constant - minHeaderHeight
        // Ensure that when the header is collapsed to min height, the scroll view can still scroll
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    
    private func setScrollPosition(_ position: CGFloat) {
        tableView.contentOffset = CGPoint(x: tableView.contentOffset.x, y: position)
    }
    
    private func scrollViewDidStopScrolling() {
        let range = maxHeaderHeight - minHeaderHeight
        let midPoint = minHeaderHeight + range / 2
        
        if headerHeightConstraint.constant > midPoint {
            expandHeader()
        } else {
            collapseHeader()
        }
    }
    
    private func collapseHeader() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.headerHeightConstraint.constant = self.minHeaderHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }
    
    private func expandHeader() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.headerHeightConstraint.constant = self.maxHeaderHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }
    
    private func updateHeader() {
        // Calculate the distance between 2 value max and min height
        let range = maxHeaderHeight - minHeaderHeight
        print("range \(range)")
        
        // Calculates the current offset with the min height
        let openAmount = headerHeightConstraint.constant - minHeaderHeight
        
        print("openAmount \(openAmount)")
        // Calculate the percentage to animate, change the UI element
        _ = openAmount / range
        
//        searchProductsHeaderView.changeLayout(with: percentage)
    }
}

// MARK: - ScrollView Delegate

extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = scrollView.contentOffset.y - previousScrollOffset
        
        // The top limit of scroll view
        let absoluteTop: CGFloat = 0.0
        // The bottom limit of scroll view
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height
        
        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
        
        guard canAnimateHeader(scrollView) else {
            return
        }
        
        // Implement logic to animate header
        var newHeight = headerHeightConstraint.constant
        if isScrollingDown {
            newHeight = max(minHeaderHeight, headerHeightConstraint.constant - abs(scrollDiff))
        } else if isScrollingUp {
            newHeight = min(maxHeaderHeight, headerHeightConstraint.constant + abs(scrollDiff))
        }
        
        if newHeight != self.headerHeightConstraint.constant {
//            _ = max(0, (0.5 - min(scrollView.contentInset.top, newHeight_llView.contentOffset.y) / 0.5)
            
            //            print(alpha)
            headerHeightConstraint.constant = newHeight
            updateHeader()
            setScrollPosition(previousScrollOffset)
        }
        
        previousScrollOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Finish scrolling
        scrollViewDidStopScrolling()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            // Finish scrolling
            scrollViewDidStopScrolling()
        }
    }
}
