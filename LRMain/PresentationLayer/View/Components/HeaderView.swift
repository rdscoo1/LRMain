//
//  HeaderView.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class HeaderView: UIView {
    
    // MARK: - UI
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    // MARK: - Private Property
    
    private let offset: CGFloat = 16
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func setTitle(_ title: String) {
        categoryLabel.text = title
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
        ])
    }
}
