//
//  SearchProductsHeaderView.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class SearchProductsHeaderView: UIView {
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Поиск товаров"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private lazy var searchView: SearchView = {
        let searchView = SearchView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()
    
    private lazy var barCodeButton: BarCodeButton = {
        let barCodeButton = BarCodeButton()
        barCodeButton.translatesAutoresizingMaskIntoConstraints = false
        return barCodeButton
    }()
    
    // MARK: - Public Properties
    
    var headerHeightConstraint: NSLayoutConstraint!
    var searchViewLeadingConstraint: NSLayoutConstraint!
    var searchViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Private Properties
    
    private let offset: CGFloat = 16
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func changeLayout(with percentage: CGFloat) {
        let subPercent = 1.0 - percentage
        
        titleLabel.alpha = percentage
        barCodeButton.alpha = percentage
        
        if percentage < 0.6 {
            searchViewLeadingConstraint.constant = offset * 5 * (percentage)
            searchViewBottomConstraint.constant = -offset * 5 * (percentage)
        } else if percentage == 0 {
            
        }
        
        searchView.setSearchButtonAlpha(with: percentage)
        backgroundColor = UIColor.blend(from: Constants.Colors.green, to: .white, percent: Double(subPercent))
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = Constants.Colors.green
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(searchView)
        addSubview(barCodeButton)
        
        headerHeightConstraint = heightAnchor.constraint(equalTo: self.heightAnchor)
        searchViewLeadingConstraint = searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
        searchViewBottomConstraint = searchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset * 2)
        
        NSLayoutConstraint.activate([
            searchViewBottomConstraint,
            searchViewLeadingConstraint,
            searchView.trailingAnchor.constraint(greaterThanOrEqualTo: barCodeButton.leadingAnchor, constant: -offset),
            searchView.heightAnchor.constraint(equalToConstant: offset * 3),
            
            barCodeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            barCodeButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            barCodeButton.heightAnchor.constraint(equalTo: searchView.heightAnchor),
            barCodeButton.widthAnchor.constraint(equalTo: barCodeButton.heightAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: searchView.topAnchor, constant: -offset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
        ])
    }
}
