//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Иван Сёмин on 20.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: CGRect(
            x: 0.0,
            y: self.view.safeAreaInsets.top,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height - self.view.safeAreaInsets.bottom
        ))
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.view.addSubview(self.profileHeaderView)
    }
}
