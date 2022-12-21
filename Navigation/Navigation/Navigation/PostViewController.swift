//
//  PostViewController.swift
//  Navigation
//
//  Created by Beliy.Bear on 15.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    var infoViewController = InfoViewController()
    var titlePost: String = "Anonymous"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                         target: self,
                                         action: #selector(showInfoViewController))
        self.navigationItem.rightBarButtonItem = infoButton
        
        setupView()
    }
    
    private func setupView() {
            self.view.backgroundColor = .systemGray2
            self.navigationItem.title = titlePost
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    
    @objc private func showInfoViewController(){
        self.present(infoViewController, animated: true, completion: nil)
    }
    
}
