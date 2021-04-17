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
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
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
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: offset / 2),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset)
        ])
    }
}
