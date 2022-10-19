//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Иван Сёмин on 21.08.2022.
//

import UIKit

struct Constants {
    static let imageWidth = 100
    static let imageHeight = 100
}

class ProfileHeaderView: UIView {
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "avatar")

        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = CGFloat(Constants.imageHeight) / 2
        
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let DEFAULT_FONT_SIZE = 18.0
        
        let label = UILabel()
        
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: DEFAULT_FONT_SIZE)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let DEFAULT_FONT_SIZE = 14.0
        
        let label = UILabel()
        
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: DEFAULT_FONT_SIZE)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Show Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = 4
        
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        button.addTarget(self, action: #selector(onTouch), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var rootContainer: UIStackView = {
        let container = UIStackView()
        
        container.axis = .vertical
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    private lazy var userDataContainer: UIStackView = {
        let container = UIStackView()
        
        container.axis = .horizontal
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    private lazy var labelsContainer: UIStackView = {
        let container = UIStackView()
        
        container.axis = .vertical
        container.distribution = .fillEqually
        
        container.translatesAutoresizingMaskIntoConstraints = false
    
        return container
    }()
    
    @objc private func onTouch() {
        print(self.statusLabel.text!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.addSubview(self.userDataContainer)
        self.addSubview(self.rootContainer)
        
        self.labelsContainer.addArrangedSubview(self.usernameLabel)
        self.labelsContainer.addArrangedSubview(self.statusLabel)
        
        self.userDataContainer.addArrangedSubview(self.avatar)
        self.userDataContainer.addArrangedSubview(self.labelsContainer)

        self.rootContainer.addArrangedSubview(self.userDataContainer)
        self.rootContainer.addArrangedSubview(self.showStatusButton)
        
        NSLayoutConstraint.activate([
            self.rootContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.rootContainer.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.rootContainer.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            
            self.userDataContainer.topAnchor.constraint(equalTo: self.rootContainer.topAnchor),
            self.userDataContainer.leftAnchor.constraint(equalTo: self.rootContainer.leftAnchor),

            self.avatar.widthAnchor.constraint(equalToConstant: CGFloat(Constants.imageWidth)),
            self.avatar.heightAnchor.constraint(equalToConstant: CGFloat(Constants.imageHeight)),
            
            self.labelsContainer.topAnchor.constraint(equalTo: self.avatar.topAnchor, constant: 11),
            self.labelsContainer.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 20),
            self.labelsContainer.bottomAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: -18),
            
            self.showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            self.showStatusButton.topAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: 16),
            self.showStatusButton.widthAnchor.constraint(equalTo: self.rootContainer.widthAnchor)
        ])
    }
}
