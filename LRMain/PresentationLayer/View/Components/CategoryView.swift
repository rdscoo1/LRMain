//
//  CategoryView.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class CategoryView: UIView {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Colors.gray
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Категория"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK: - Public Methods
    
    #warning("Переделать в protocol")
    func setCategoryWith(name: String, photo: UIImage) {
        categoryLabel.text = name
        categoryImageView.image = photo
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        containerView.layer.cornerRadius = offset / 4
        
        addSubview(containerView)
        containerView.addSubview(categoryLabel)
        containerView.addSubview(categoryImageView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            categoryLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: offset),
            categoryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: offset),
            categoryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -offset),
            
            categoryImageView.heightAnchor.constraint(equalToConstant: offset * 6),
            categoryImageView.widthAnchor.constraint(equalToConstant: offset * 6),
            categoryImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: offset * 2),
            categoryImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: offset)
        ])
    }
}

