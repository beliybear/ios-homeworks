import UIKit

class FeedViewController: UIViewController {
    
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let buttonFirst: UIButton = {
        let button = UIButton()
        button.setTitle("View post", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let buttonSecond: UIButton = {
        let button = UIButton()
        button.setTitle("View post", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let postController = PostViewController().self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemGray2
        addTargets()
        setupConstraints()
    }
    
    func addTargets() {
            buttonFirst.addTarget(self, action: #selector(toPostView), for: .touchUpInside)
            buttonSecond.addTarget(self, action: #selector(toPostView), for: .touchUpInside)
        }
    
    func setupConstraints() {
       view.addSubview(stackView)
       stackView.addArrangedSubview(buttonFirst)
       stackView.addArrangedSubview(buttonSecond)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func toPostView() {
        self.navigationController?.pushViewController(postController, animated: true)
        postController.titlePost = "New Post"
    }
}
