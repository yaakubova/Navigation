//
//  PostViewController.swift
//  Navigation
//
//  Created by Иван Сёмин on 20.08.2022.
//

import UIKit

class PostViewController: UIViewController {

    var postTitle: String = "Template title"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemMint
        self.navigationItem.title = postTitle
        
        navigationItem.rightBarButtonItem = barButton
    }

    private lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onTouch))
        
        button.title = postTitle
        
        return button
    }()
    
    @objc private func onTouch() {
        let infoController = InfoViewController()
        
        infoController.alertTitle = postTitle
        
        self.present(infoController, animated: true, completion: nil)
    }

}
