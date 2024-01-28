//
//  MovieMainViewController.swift
//  SeSACCodeBase
//
//  Created by 김진수 on 1/28/24.
//

import UIKit
import SnapKit



class MovieMainViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let shadowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let oneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let twoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let threeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
}

extension MovieMainViewController: ConfigureUIProtocol {
    
    func configureUI() {
        designNav()
        configureHierarchy()
        designImageView()
        designLabel()
        designButton()
        designStackView()
        
        self.view.backgroundColor = .black
    }
    
    func configureHierarchy() {
        self.view.addSubview(mainImageView)
        self.mainImageView.addSubview(shadowImageView)
        self.shadowImageView.addSubview(tagLabel)
        self.shadowImageView.addSubview(buttonStackView)
        self.view.addSubview(categoryLabel)
        self.view.addSubview(imageStackView)
    }
    
    func designNav() {
        self.navigationItem.title = "김진수님"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func designImageView() {
        self.mainImageView.image = .신과함께인과연
        self.mainImageView.layer.cornerRadius = 10
        
        self.shadowImageView.image = .background
        
        self.oneImageView.image = .극한직업
        self.twoImageView.image = .도둑들
        self.threeImageView.image = .명량
        
        self.mainImageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(self.mainImageView.snp.width).multipliedBy(1.15)
        }
        self.shadowImageView.snp.makeConstraints { make in
            make.horizontalEdges.height.equalToSuperview()
        }
    }
    
    func designLabel() {
        self.tagLabel.text = "응원하고픈 흥미진진 사극 전투 한국 작품"
        self.categoryLabel.text = "지금 뜨는 콘텐츠"
        
        self.tagLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.shadowImageView).inset(40)
            make.height.equalTo(20)
            make.bottom.equalTo(self.shadowImageView).inset(80)
        }
        
        self.categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(self.mainImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
    }
    
    func designStackView() {
        [playButton, addButton].map {
            self.buttonStackView.addArrangedSubview($0)
        }
        
        [oneImageView, twoImageView, threeImageView].map {
            self.imageStackView.addArrangedSubview($0)
        }
        
        self.buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(self.tagLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        self.imageStackView.snp.makeConstraints { make in
            make.top.equalTo(self.categoryLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
    }
    
    func designButton() {
        self.playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        self.playButton.setTitle("재생", for: .normal)
        
        self.addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        self.addButton.setTitle("내가 찜한 리스트", for: .normal)
    }

}
