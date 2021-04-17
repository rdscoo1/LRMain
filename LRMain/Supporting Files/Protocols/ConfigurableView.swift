//
//  ConfigurableView.swift
//  LRMain
//
//  Created by Roman Khodukin on 16.04.2021.
//

import Foundation

protocol ConfigurableView {
    associatedtype ConfigurableModel
    
    func configure(with model: ConfigurableModel)
}
