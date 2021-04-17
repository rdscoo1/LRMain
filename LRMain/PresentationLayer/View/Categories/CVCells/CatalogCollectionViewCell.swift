//
//  CatalogCollectionViewCell.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CatalogCollectionViewCell"
    
    // MARK: - UI

    private lazy var catalogView: CatalogView = {
        let catalogView = CatalogView()
        catalogView.translatesAutoresizingMaskIntoConstraints = false
        return catalogView
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
        contentView.addSubview(catalogView)
        
        NSLayoutConstraint.activate([
            catalogView.topAnchor.constraint(equalTo: contentView.topAnchor),
            catalogView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            catalogView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            catalogView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
