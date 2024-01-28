//
//  SearchViewController.swift
//  SeSACCodeBase
//
//  Created by 김진수 on 1/28/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.backgroundColor = .gray
        searchBar.barTintColor = .black
        return searchBar
    }()
    
    let openButton: UIButton = {
        let button = UIButton()
        button.setTitle("공개 예정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.setImage(.blue, for: .normal)
        return button
    }()
    
    let popularButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두의 인기 콘텐츠", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setImage(.turquoise, for: .normal)
        return button
    }()
    
    let topButton: UIButton = {
        let button = UIButton()
        button.setTitle("TOP 10 시리즈", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setImage(.pink, for: .normal)
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    
    let introduceLabel: UILabel = {
        let label = UILabel()
        label.text = "이런! 찾으시는 작품이 없습니다."
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var buttonArray: [UIButton] = [openButton, popularButton, topButton]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    @objc func tappedButton(sender: UIButton) {
        for button in buttonArray {
            if sender == button {
                button.setTitleColor(.black, for: .normal)
                button.backgroundColor = .white
                switch button {
                case _ where button == openButton:
                    self.introduceLabel.text = "이런! 공개 예정인 작품이 없습니다."
                case _ where button == popularButton:
                    self.introduceLabel.text = "이런! 인기있는 작품이 없습니다."
                case _ where button == topButton:
                    self.introduceLabel.text = "이런! TOP 10에 있는 작품이 없습니다."
                default:
                    print("error")
                }
            } else {
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .black
            }
        }
    }

}

extension SearchViewController: ConfigureUIProtocol {
    func configureUI() {
        
        configureHierarchy()
        designNav()
        designLabel()
        designImageView()
        designSearchBar()
        designStackView()
        
        self.view.backgroundColor = .black
    }
    
    func designNav() {
        self.navigationItem.title = "NEW & HOT 검색"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    func designImageView() {
        
    }
    
    func designLabel() {
        self.introduceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.subLabel.snp.makeConstraints { make in
            make.top.equalTo(self.introduceLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    func configureHierarchy() {
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.buttonStackView)
        self.view.addSubview(self.introduceLabel)
        self.view.addSubview(self.subLabel)
    }
    
    func designStackView() {
        [openButton, popularButton, topButton].map {
            $0.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
            self.buttonStackView.addArrangedSubview($0)
        }
        
        self.buttonStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(3)
            make.top.equalTo(self.searchBar.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
    }
}

extension SearchViewController {
    func designSearchBar() {
        self.searchBar.searchTextField.setPlaceholder(string: "게임,시리즈,영화를 검색하세요...", color: .white)
        
        self.searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
    }
}
