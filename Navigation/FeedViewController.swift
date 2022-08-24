//
//  FeedViewController.swift
//  Navigation
//
//  Created by Иван Сёмин on 20.08.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post #1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemCyan
        self.view.addSubview(self.button)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 220, width: 300, height: 50))
        
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.setTitle("To Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onTouch), for: .touchUpInside)
        
        
        return button
    }()
    
    @objc private func onTouch() {
        let postController = PostViewController()
        postController.postTitle = post.title
        
        self.navigationController?.pushViewController(postController, animated: true)
    }
}
