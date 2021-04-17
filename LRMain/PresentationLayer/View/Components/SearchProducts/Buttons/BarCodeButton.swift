//
//  BarCodeButton.swift
//  LRMain
//
//  Created by Roman Khodukin on 17.04.2021.
//

import UIKit

class BarCodeButton: UIButton {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    
    private func setupUI() {
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = .white
        setImage(.barcodeIcon, for: .normal)
        tintColor = .black
    }
}
