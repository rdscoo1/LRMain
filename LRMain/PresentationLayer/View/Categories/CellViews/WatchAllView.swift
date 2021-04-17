//
//  WatchAllView.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class WatchAllView: UIView {

    // MARK: - UI
    
    private lazy var nextButton: NextButton = {
        let button = NextButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var watchAllLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Смотреть всё"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
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
    
    // MARK: - Private Methods
    
    private func setupView() {
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = Constants.Colors.gray
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(nextButton)
        addSubview(watchAllLabel)
        
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: offset * 6),
            nextButton.widthAnchor.constraint(equalToConstant: offset * 6),
            nextButton.topAnchor.constraint(equalTo: topAnchor, constant: offset * 3),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            watchAllLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset * 2),
            watchAllLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            watchAllLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset)
        ])
    }

}
