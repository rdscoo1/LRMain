//
//  SearchView.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class SearchView: UIView {
    
    // MARK: - UI
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Поиск"
        textField.backgroundColor = .clear
        return textField
    }()
    
    private lazy var searchButton: SearchButton = {
        let searchButton = SearchButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        return searchButton
    }()
    
    // MARK: - Private Property
    
    private let offset: CGFloat = 8
    
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
        layer.cornerRadius = Constants.cornerRadius
        
        setupLayout()
    }
    
    
    private func setupLayout() {
        addSubview(searchTextField)
        addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: topAnchor, constant: offset / 2),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset / 2),
            searchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset / 2),
            searchButton.widthAnchor.constraint(equalToConstant: 48),
            
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8),
            searchTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
