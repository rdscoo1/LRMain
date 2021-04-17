//
//  WatchAllView.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class WatchAllView: UIView {

    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
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
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        containerView.layer.cornerRadius = offset / 2
        containerView.backgroundColor = Constants.Colors.gray
        
        addSubview(containerView)
        containerView.addSubview(nextButton)
        containerView.addSubview(watchAllLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nextButton.heightAnchor.constraint(equalToConstant: offset * 6),
            nextButton.widthAnchor.constraint(equalToConstant: offset * 6),
            nextButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: offset * 3),
            nextButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            watchAllLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -offset * 2),
            watchAllLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: offset),
            watchAllLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -offset)
        ])
    }

}
