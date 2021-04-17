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
    
    // MARK: - Private Property
    
    private let offset: CGFloat = 16
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        NSLayoutConstraint.activate([
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset * 2),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            searchView.trailingAnchor.constraint(greaterThanOrEqualTo: barCodeButton.leadingAnchor, constant: -offset),
            searchView.heightAnchor.constraint(equalToConstant: 48),
            
            barCodeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            barCodeButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            barCodeButton.heightAnchor.constraint(equalTo: searchView.heightAnchor),
            barCodeButton.widthAnchor.constraint(equalTo: barCodeButton.heightAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: searchView.topAnchor, constant: -offset),
            titleLabel.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
        ])
    }
}
