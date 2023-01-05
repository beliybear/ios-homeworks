//
//  LoginViewController.swift
//  Navigation
//
//  Created by Beliy.Bear on 30.12.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var logoImage: UIImageView = {
          let logoImage = UIImageView()
          logoImage.image = UIImage(named: "logo")
          logoImage.translatesAutoresizingMaskIntoConstraints = false
          return logoImage
      }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.spacing = 0.5
        stackView.backgroundColor = .white
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var logIn: UITextField = {
        let logIn = UITextField()
        logIn.tag = 0
        logIn.textColor = .black
        logIn.backgroundColor = .systemGray6
        logIn.textAlignment = .left
        logIn.placeholder = "  Email or phone"
        logIn.tintColor =  UIColor (named: "myColor")
        logIn.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        logIn.autocapitalizationType = .none
        logIn.clearButtonMode = .whileEditing
        logIn.delegate = self
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
    }()
    
    private lazy var password: UITextField = {
        let password = UITextField()
        password.tag = 1
        password.textColor = .black
        password.backgroundColor = .systemGray6
        password.textAlignment = .left
        password.placeholder = "  Password"
        password.tintColor = UIColor (named: "myColor")
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.clearButtonMode = .whileEditing
        password.delegate = self
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    private lazy var button: UIButton = {
        let logInButton = UIButton()
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.backgroundColor = UIColor(patternImage: UIImage (named: "blue_pixel")!)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(toProfile), for: .touchUpInside)
        return logInButton
    }()
    
    private var logInText: String?
    
    private var passwordText: String?
    
    let profileViewController = ProfileViewController().self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupGestures()
        addSubview()
        setupConstraints()
    }
    
    private func addSubview() {
        stackView.addArrangedSubview(logIn)
        stackView.addArrangedSubview(password)
        view.addSubview(scrollView)
        scrollView.addSubview(logoImage)
        scrollView.addSubview(stackView)
        scrollView.addSubview(button)
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.willShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.willHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
             logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             logoImage.heightAnchor.constraint(equalToConstant: 100),
             logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.heightAnchor.constraint(equalToConstant: 100),
             stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
             stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
           button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc func toProfile() {
            self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
            scrollView.contentInset.bottom = 0.0
        }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
            scrollView.contentInset.bottom += keyboardHeight ?? 0.0
        }
    
    @objc private func forcedHidingKeyboard() {
        view.endEditing(true)
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        print("\(textField.text ?? "No text")")
        if textField.tag == 0 {
            logInText = textField.text
        }
        if textField.tag == 1 {
            passwordText = textField.text
        }
    }
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}



