//
//  InfoViewController.swift
//  Navigation
//
//  Created by Beliy.Bear on 16.12.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                         target: self,
                                         action: #selector(showSimpleAlert))
        self.navigationItem.rightBarButtonItem = infoButton
        
        setupButton()
    }
    
    private lazy var button: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGray
            button.layer.cornerRadius = 12
            button.setTitle("Share", for: .normal)
            button.setTitleColor(.systemGray3, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.addTarget(self, action: #selector(showSimpleAlert), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    private func setupButton() {
            self.view.addSubview(self.button)
            self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300).isActive = true
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    
    @objc func showSimpleAlert() {
            let alert = UIAlertController(title: "Sharing",
                                          message: "Share this post?",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes",
                                      style: UIAlertAction.Style.cancel,
                                      handler: { (action) in print("Ok, post shared")}))
        
            alert.addAction(UIAlertAction(title: "No",
                                  style: UIAlertAction.Style.default,
                                  handler: { (action) in print("Ok, alert closed")}))
        
            self.present(alert, animated: true, completion: nil)
        }

    }

