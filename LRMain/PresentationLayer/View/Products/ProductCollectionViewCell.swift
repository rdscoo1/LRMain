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
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var priceView: PriceView = {
        let priceView = PriceView()
        priceView.translatesAutoresizingMaskIntoConstraints = false
        return priceView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Плитка"
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - Private Property
    
    private let offset: CGFloat = 8
    
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
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(priceView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: offset),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset * 2),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset * 2),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            priceView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: offset * 2),
            priceView.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            priceView.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            priceView.heightAnchor.constraint(equalToConstant: 22),
                        
            nameLabel.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: offset),
            nameLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
        ])
    }
}

// MARK: - ConfigurableView

extension ProductCollectionViewCell: ConfigurableView {
    func configure(with model: Product) {
        photoImageView.image = model.image
        priceView.setPrice(value: model.price)
        nameLabel.text = model.name
    }
}
