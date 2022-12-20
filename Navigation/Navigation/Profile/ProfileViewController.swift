//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Beliy.Bear on 19.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView: ProfileHeaderView = {
           let profile = ProfileHeaderView()
           profile.translatesAutoresizingMaskIntoConstraints = false
           return profile
       }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileConstraints()
    }
    
    func profileConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
    
  
