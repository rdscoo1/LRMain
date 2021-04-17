//
//  CategoryView.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class CategoryView: UIView {
    
    // MARK: - UI
    
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
        
        setupView()
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
    
    private func setupView() {
        backgroundColor = Constants.Colors.gray
        clipsToBounds = true
        layer.cornerRadius = Constants.cornerRadius

        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(categoryLabel)
        addSubview(categoryImageView)
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            
            categoryImageView.heightAnchor.constraint(equalToConstant: offset * 6),
            categoryImageView.widthAnchor.constraint(equalToConstant: offset * 6),
            categoryImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: offset * 2),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset)
        ])
    }
}
