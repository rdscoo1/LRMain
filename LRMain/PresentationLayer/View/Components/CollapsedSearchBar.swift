//
//  CollapsedSearchBar.swift
//  LRMain
//
//  Created by Roman Khodukin on 27.04.2021.
//

import UIKit

class CollapsedSearchBar: UIView {

    
    // MARK: - UI
    
    private lazy var textFieldPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Поиск"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Private Property
    
    private let offset: CGFloat = 16
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(textFieldPlaceholderLabel)
        addSubview(shadowView)
        
        NSLayoutConstraint.activate([
            textFieldPlaceholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            textFieldPlaceholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            textFieldPlaceholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.heightAnchor.constraint(equalToConstant: 4)
        ])
    }

}
