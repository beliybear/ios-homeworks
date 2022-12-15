//
//  FeedViewController.swift
//  Navigation
//
//  Created by Beliy.Bear on 15.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Anonymous")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        buttonAction()

        view.backgroundColor = .systemGray2
    }
    
    private lazy var button: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGray
            button.layer.cornerRadius = 12
            button.setTitle("Go Post", for: .normal)
            button.setTitleColor(.systemGray3, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button

        }()
    private func setupButton() {
            self.view.addSubview(self.button)
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

    @objc private func buttonAction() {
            let postViewController = PostViewController()
            postViewController.titlePost = post.title
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
