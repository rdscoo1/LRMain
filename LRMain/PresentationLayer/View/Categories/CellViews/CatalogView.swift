//
//  CatalogView.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

class CatalogView: UIView {
    
    // MARK: - UI

    private lazy var catalogLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Каталог"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private lazy var catalogIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .bulletListIcon
        imageView.tintColor = .white
        return imageView
    }()
    
    // MARK: - Private Property
    
    private let offset: CGFloat = 12
    
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
        layer.cornerRadius = Constants.cornerRadius

        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(catalogLabel)
        addSubview(catalogIconImageView)
        
        NSLayoutConstraint.activate([
            catalogLabel.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            catalogLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            catalogLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            
            catalogIconImageView.heightAnchor.constraint(equalToConstant: offset * 3),
            catalogIconImageView.widthAnchor.constraint(equalToConstant: offset * 3 - 4),
            catalogIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            catalogIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset)
        ])
    }
}
