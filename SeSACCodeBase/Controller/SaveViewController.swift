//
//  SaveViewController.swift
//  SeSACCodeBase
//
//  Created by 김진수 on 1/28/24.
//

import UIKit
import SnapKit

class SaveViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .dummy
        return imageView
    }()
    
    let subOneLabel: UILabel = {
        let label = UILabel()
        label.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해드립니다."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let subTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let subThreeLabel: UILabel = {
        let label = UILabel()
        label.text = "없어요."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.alignment = .center
        return stackView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "'나만의 자동 저장' 기능"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("설정하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    

}

extension SaveViewController: ConfigureUIProtocol {
    func configureUI() {
        configureHierarchy()
        designNav()
        designImageView()
        designLabel()
        designStackView()
        designButton()
        
        self.view.backgroundColor = .black
    }
    
    func designNav() {
        self.navigationItem.title = "저장한 콘텐츠 목록"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func designImageView() {
        self.mainImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(self.mainImageView.snp.width).multipliedBy(0.65)
        }
    }
    
    func designLabel() {
        self.mainLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.labelStackView.snp.top).offset(-40)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
        }
    }
    
    func designStackView() {
        [subOneLabel, subTwoLabel, subThreeLabel].map {
            self.labelStackView.addArrangedSubview($0)
        }
        
        self.labelStackView.snp.makeConstraints { make in
            make.bottom.equalTo(self.mainImageView.snp.top).offset(5)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(60)
        }
    }
    
    func designButton() {
        self.settingButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            make.top.equalTo(self.mainImageView.snp.bottom).offset(40)
        }
        
        self.saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(60)
            make.top.equalTo(self.settingButton.snp.bottom).offset(20)
        }
    }
    
    func configureHierarchy() {
        self.view.addSubview(mainImageView)
        self.view.addSubview(labelStackView)
        self.view.addSubview(mainLabel)
        self.view.addSubview(settingButton)
        self.view.addSubview(saveButton)
    }
    
    
}
