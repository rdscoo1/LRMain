//
//  CatalogView.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

class CatalogView: UIView {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Colors.green
        return view
    }()
    
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
    
    private let offset: CGFloat = 16
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        containerView.layer.cornerRadius = offset / 4
        
        addSubview(containerView)
        containerView.addSubview(catalogLabel)
        containerView.addSubview(catalogIconImageView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            catalogLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: offset),
            catalogLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: offset),
            catalogLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -offset),
            
            catalogIconImageView.heightAnchor.constraint(equalToConstant: offset * 2),
            catalogIconImageView.widthAnchor.constraint(equalToConstant: offset * 2),
            catalogIconImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -offset),
            catalogIconImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -offset)
        ])
    }
}
