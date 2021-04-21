//
//  PriceView.swift
//  LRMain
//
//  Created by Roman Khodukin on 21.04.2021.
//

import UIKit

class PriceView: UIView {
    
    // MARK: - UI
    
    private lazy var roublesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 1
        label.text = "10000000"
        return label
    }()
    
    private lazy var pennyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        label.text = "35"
        return label
    }()
    
    private lazy var perItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        label.text = "₽/шт."
        return label
    }()
    
    // MARK: - Private Property
    
    private let offset: CGFloat = 8
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func setPrice(value: Double, for item: String = "₽/шт.") {
        if floor(value) == value {
            roublesLabel.text = value.formattedWithSeparator
            pennyLabel.text = ""
        } else {
            let numbers = String(format: "%.2f", value).components(separatedBy: ".")
            guard let rubles:Double = Double(numbers.first ?? ""),
                  let penny = numbers.last else {
                return
            }
            roublesLabel.text = "\(rubles.formattedWithSeparator),"
            pennyLabel.text = penny
        }

        perItemLabel.text = item
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        layer.cornerRadius = Constants.cornerRadius

        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(roublesLabel)
        addSubview(pennyLabel)
        addSubview(perItemLabel)
        
        NSLayoutConstraint.activate([
            roublesLabel.topAnchor.constraint(equalTo: topAnchor),
            roublesLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            pennyLabel.leadingAnchor.constraint(equalTo: roublesLabel.trailingAnchor),
            pennyLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            perItemLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            perItemLabel.leadingAnchor.constraint(equalTo: pennyLabel.trailingAnchor, constant: 4),
        ])
    }
}
