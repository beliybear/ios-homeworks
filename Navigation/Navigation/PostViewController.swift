//
//  PostViewController.swift
//  Navigation
//
//  Created by Beliy.Bear on 15.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "Anonymous"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                         target: self,
                                         action: #selector(showSimpleAlert))
        self.navigationItem.rightBarButtonItem = infoButton
    }
    
    private func setupView() {
            self.view.backgroundColor = .systemGray2
            self.navigationItem.title = titlePost
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    
    @objc func showSimpleAlert() {
            let alert = UIAlertController(title: "Sharing",
                                          message: "Share this post?",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes",
                                      style: UIAlertAction.Style.cancel,
                                      handler: { (action) in print("Ok, post shared")
            }))
            alert.addAction(UIAlertAction(title: "No",
                                  style: UIAlertAction.Style.default,
                                  handler: { (action) in print("Ok, alert closed")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    
}
