//
//  ConfigureUI.swift
//  SeSACCodeBase
//
//  Created by 김진수 on 1/28/24.
//

import Foundation

@objc protocol ConfigureUIProtocol {
    func configureUI()
    func designNav()
    func designImageView()
    func designLabel()
    func configureHierarchy()
    @objc optional func designButton()
    @objc optional func designStackView()
}
