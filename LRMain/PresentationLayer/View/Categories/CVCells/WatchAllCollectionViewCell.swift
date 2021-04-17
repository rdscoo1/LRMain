//
//  WatchAllCollectionViewCell.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class WatchAllCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "WatchAllCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var watchAllView: WatchAllView = {
        let watchAllView = WatchAllView()
        watchAllView.translatesAutoresizingMaskIntoConstraints = false
        return watchAllView
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
        contentView.addSubview(watchAllView)
        
        NSLayoutConstraint.activate([            
            watchAllView.topAnchor.constraint(equalTo: contentView.topAnchor),
            watchAllView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            watchAllView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            watchAllView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
    }
}
