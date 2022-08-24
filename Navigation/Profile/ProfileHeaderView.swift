//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Иван Сёмин on 21.08.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "avatar")
        imageView.frame = CGRect(
            x: self.safeAreaInsets.left + 16,
            y: self.safeAreaInsets.top + 16,
            width: 100,
            height: 100
        )

        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    private let DEFAULT_TEXT_OFFSET = 20.0
    
    private lazy var usernameLabel: UILabel = {
        let DEFAULT_Y_OFFSET = 11.0
        let DEFAULT_FONT_SIZE = 18.0
        
        let label = UILabel()
        
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: DEFAULT_FONT_SIZE)
        
        label.frame = CGRect(
            x: self.avatar.frame.maxX + self.DEFAULT_TEXT_OFFSET,
            y: self.avatar.frame.minY + DEFAULT_Y_OFFSET,
            width: self.frame.width - self.avatar.frame.width,
            height: DEFAULT_FONT_SIZE
        )
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let DEFAULT_Y_OFFSET = 18.0
        let DEFAULT_FONT_SIZE = 14.0
        
        let label = UILabel()
        
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: DEFAULT_FONT_SIZE)
        
        label.frame = CGRect(
            x: self.avatar.frame.maxX + self.DEFAULT_TEXT_OFFSET,
            y: self.avatar.frame.maxY - DEFAULT_Y_OFFSET - DEFAULT_FONT_SIZE,
            width: self.frame.width - self.avatar.frame.width,
            height: DEFAULT_FONT_SIZE
        )
        
        return label
    }()
    
    private lazy var showStatusButton: UIButton = {
        let DEFAULT_Y_OFFSET = 16.0
        
        let button = UIButton(frame: CGRect(
            x: self.avatar.frame.minX,
            y: self.avatar.frame.maxY + DEFAULT_Y_OFFSET,
            width: self.frame.width - (2 * self.avatar.frame.minX),
            height: 90
        ))
        
        button.setTitle("Show Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = 4
        
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        button.addTarget(self, action: #selector(onTouch), for: .touchUpInside)
        
        return button
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
        self.addSubview(self.avatar)
        self.addSubview(self.usernameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.showStatusButton)
    }
}
