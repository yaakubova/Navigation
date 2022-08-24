//
//  InfoViewController.swift
//  Navigation
//
//  Created by Иван Сёмин on 20.08.2022.
//

import UIKit

class InfoViewController: UIViewController {

    var alertTitle = "Template Alert Title"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.button)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 220, width: 300, height: 50))
        
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.setTitle("To Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onTouch), for: .touchUpInside)
        
        
        return button
    }()
    
    @objc private func onTouch() {
        let alert = UIAlertController(title: self.alertTitle, message: "Are you sure you want to Edit?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in print("Yes") }))
        alert.addAction(UIAlertAction(title: "Нет", style: .default, handler: { _ in print("No") }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
