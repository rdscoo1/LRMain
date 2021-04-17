//
//  NextButton.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class NextButton: UIButton {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.height / 2
    }
    
    // MARK: - Private Method
    
    private func setupUI() {
        backgroundColor = Constants.Colors.green
        setImage(.arrow, for: .normal)
        tintColor = .white
    }

}
