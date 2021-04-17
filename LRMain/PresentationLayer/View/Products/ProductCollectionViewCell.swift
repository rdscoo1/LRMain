//
//  ProductCollectionViewCell.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "ProductCollectionViewCell"
    
    // MARK: - UI
        
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "120"
        return label
    }()
    
    private lazy var currencyPerItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "Р/шт."
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Плитка"
        label.numberOfLines = 2
        return label
    }()
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        contentView.layer.cornerRadius = Constants.cornerRadius
        
        contentView.addSubview(containerView)
        containerView.addSubview(photoImageView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(currencyPerItemLabel)
        containerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            photoImageView.heightAnchor.constraint(equalToConstant: 96),
            photoImageView.widthAnchor.constraint(equalToConstant: 96),
            photoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            photoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: 4),
            
            currencyPerItemLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            currencyPerItemLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 4),
            
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4)
        ])
    }
}

// MARK: - ConfigurableView

extension ProductCollectionViewCell: ConfigurableView {
    func configure(with model: Product) {
        photoImageView.image = model.image
        priceLabel.text = String(model.price)
        nameLabel.text = model.name
    }
}
