//
//  CategoriesTableViewCell.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

enum CatalogSections {
    case catalog
    case categories([Category])
    case watchAll
}

class CategoriesTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: self)
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CatalogCollectionViewCell.self,
                                forCellWithReuseIdentifier: CatalogCollectionViewCell.reuseId)
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
        collectionView.register(WatchAllCollectionViewCell.self,
                                forCellWithReuseIdentifier: WatchAllCollectionViewCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 128, height: 124)
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    // MARK: - Private Properties
    
    private lazy var catalogSections: [CatalogSections] = [.catalog, .categories(categories), .watchAll]
    
    // MARK: - Public Properties
    
    var categories: [Category] = []
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Properties
    
    private func setupLayout() {
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
    
}

// MARK: - UICollectionViewDataSource

extension CategoriesTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return catalogSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch catalogSections[section] {
        case .catalog:
            return 1
        case .categories(let items):
            return items.count
        case .watchAll:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch catalogSections[indexPath.section] {
        case .catalog:
            guard let catalogCell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.reuseId, for: indexPath) as? CatalogCollectionViewCell
            else {
                fatalError("Expected cell with reuse identifier: \(CatalogCollectionViewCell.reuseId)")
            }
            return catalogCell
        case .categories(let items):
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as? CategoryCollectionViewCell else {
                fatalError("Expected cell with reuse identifier: \(CategoryCollectionViewCell.reuseId)")
            }
            
            let category = items[indexPath.item]
            categoryCell.configure(with: category)
            
            return categoryCell
        case .watchAll:
            guard let watchAllCell = collectionView.dequeueReusableCell(withReuseIdentifier: WatchAllCollectionViewCell.reuseId, for: indexPath) as? WatchAllCollectionViewCell else {
                fatalError("Expected cell with reuse identifier: \(WatchAllCollectionViewCell.reuseId)")
            }
            
            return watchAllCell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension CategoriesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform.identity
            }
        }
    }
}
