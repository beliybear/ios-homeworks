//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Beliy.Bear on 19.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var statusText: String = ""
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let fullNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.text = "BeliyBear"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var statusLabel: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.text = "Waiting for something..."
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var statusTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.textAlignment = .center
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.placeholder = "Waiting for something..."
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var changeTitle: UIButton = {
        let titleButton = UIButton()
        titleButton.setTitle("Profile", for: .normal)
        titleButton.setTitleColor(UIColor.black, for: .normal)
        titleButton.backgroundColor = .lightGray
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        return titleButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImage()
        addView()
        setupConstraints()
        addTargets()
        changeStatusText()
    }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    func addImage(){
        avatarImageView.image = UIImage(named: "avatarImage.jpeg")
    }
    
    func addView() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(changeTitle)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -50),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -5),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            changeTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            changeTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            changeTitle.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func addTargets() {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
     }
    
    func changeStatusText() {
         setStatusButton.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
     }
    
    @objc func buttonPressed() {
        print(statusLabel.text ?? "No text")
        statusLabel.text = statusTextField.text
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text ?? "No text"
    }
}
