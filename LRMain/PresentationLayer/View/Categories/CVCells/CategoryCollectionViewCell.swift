//
//  CategoryCollectionViewCell.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: self)
    
    // MARK: - UI

    private lazy var categoryView: CategoryView = {
        let categoryView = CategoryView()
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        return categoryView
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
        contentView.addSubview(categoryView)
        
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - ConfigurableView

extension CategoryCollectionViewCell: ConfigurableView {
    func configure(with model: Category) {
        categoryView.setCategoryWith(name: model.title, photo: model.image)
    }
}
