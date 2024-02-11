
import UIKit

class ViewController: UIViewController {

    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "Gradient")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    private lazy var label: UILabel = {
       let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    // Email or username input field
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email&Username"
        emailTextField.borderStyle = .roundedRect
        emailTextField.setLeftIcon(image: UIImage(systemName: "person") ?? UIImage(), color: UIColor.gray)
        emailTextField.setRightIcon(image: UIImage(systemName: "checkmark.circle.fill") ?? UIImage(), color: UIColor.green)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        return emailTextField
    }()

    // Password input field
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.setLeftIcon(image: UIImage(systemName: "lock") ?? UIImage(), color: UIColor.gray)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()

    // Login button
     lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        loginButton.layer.cornerRadius = 5
        loginButton.backgroundColor = .purple
        loginButton.tintColor = .white
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowOffset = .zero
        loginButton.layer.shadowRadius = 15
        loginButton.layer.shouldRasterize = true
        loginButton.layer.rasterizationScale = UIScreen.main.scale
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    private lazy var textButton: UIButton = {
        let textButton = UIButton()
        textButton.setTitle("Forgot your password?", for: .normal)
        textButton.setTitleColor(UIColor.systemPurple, for: .normal)
        textButton.titleLabel?.font = UIFont(name: "Avenir-Next", size: 12)
        textButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        textButton.translatesAutoresizingMaskIntoConstraints = false
        return textButton
    }()
    
    // MARK: - Lifcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        createGesture()
    }
    
    // MARK: - Setups
    // добавление клавиатуры на view
     private func createGesture() {
         let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
         view.addGestureRecognizer(gesture)
     }
    
    private func setupHierarchy() {
        view.addSubViews([imageView, label, emailTextField, passwordTextField, loginButton, textButton])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: loginButton.topAnchor, constant: -80),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -60),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            textButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textButton.centerYAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
        ])
    }
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        let viewController = NextViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
   //  скрытие клавиатуры
    @objc private func viewTapped() {
        view.endEditing(true)
    }
}

