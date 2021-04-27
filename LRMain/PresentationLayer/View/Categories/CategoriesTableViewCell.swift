//
//  CategoriesTableViewCell.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import UIKit

enum CatalogCells {
    case catalog
    case categories(Category)
    case watchAll
}

class CategoriesTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: self)
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
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
        collectionView.decelerationRate = .fast
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var layout: CarouselCollectionViewLayout = {
        let layout = CarouselCollectionViewLayout()
        layout.itemSize = CGSize(width: 124, height: 124)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()

    
    // MARK: - Private Properties
    
    private lazy var catalogCells: [CatalogCells] = [.catalog]
    
    // MARK: - Public Properties
    
    var categories: [Category] = [] {
        didSet {
            for category in categories {
                catalogCells.append(.categories(category))
            }
            catalogCells.insert(.watchAll, at: categories.count + 1)
        }
    }
    
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
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension CategoriesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = catalogCells[indexPath.row]
        
        switch cellModel {
        case .catalog:
            guard let catalogCell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.reuseId, for: indexPath) as? CatalogCollectionViewCell
            else {
                fatalError("Expected cell with reuse identifier: \(CatalogCollectionViewCell.reuseId)")
            }
            return catalogCell
        case .categories(let item):
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as? CategoryCollectionViewCell else {
                fatalError("Expected cell with reuse identifier: \(CategoryCollectionViewCell.reuseId)")
            }
            
//            let category = items[indexPath.item]
            categoryCell.configure(with: item)
            
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
