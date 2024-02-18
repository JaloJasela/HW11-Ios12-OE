
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
    
    open lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email&Username"
        emailTextField.borderStyle = .roundedRect
        emailTextField.setLeftIcon(image: UIImage(systemName: "person") ?? UIImage(), color: UIColor.gray)
        emailTextField.setRightIcon(image: UIImage(systemName: "checkmark.circle.fill") ?? UIImage(), color: UIColor.green)
        emailTextField.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        return emailTextField
    }()

    open lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.setLeftIcon(image: UIImage(systemName: "lock") ?? UIImage(), color: UIColor.gray)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()

    private lazy var loginButton: UIButton = {
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
    
    private lazy var textLabel: UILabel = {
       let textLabel = UILabel()
        textLabel.text = "Forgot your password?"
        textLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        textLabel.textColor = .systemPurple
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 1
        return textLabel
    }()
    
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var textAndLine: UILabel = {
       let textAndLine = UILabel()
        textAndLine.text = "or connect with"
        textAndLine.font = UIFont.systemFont(ofSize: 12, weight: .light)
        textAndLine.backgroundColor = .white
        textAndLine.textColor = .systemPurple
        textAndLine.textAlignment = .center
        textAndLine.translatesAutoresizingMaskIntoConstraints = false
        textAndLine.numberOfLines = 1
        return textAndLine
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonLeft, buttonRight])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var buttonLeft: UIButton = {
        let buttonLeft = UIButton()
        buttonLeft.setTitle("Facebook", for: .normal)
        buttonLeft.setImage(UIImage(named: "facebook")?.withRenderingMode(.automatic), for: .normal)
        buttonLeft.imageView?.contentMode = .scaleToFill
        buttonLeft.imageEdgeInsets = UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 100)
        buttonLeft.setTitleColor(.white, for: .normal)
        buttonLeft.backgroundColor = .systemBlue
        buttonLeft.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        buttonLeft.layer.cornerRadius = 15
        buttonLeft.configuration?.imagePadding = 0
        buttonLeft.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        return buttonLeft
    }()
    
    private lazy var buttonRight: UIButton = {
        let buttonRight = UIButton()
        buttonRight.setTitle("Twitter", for: .normal)
        buttonRight.setImage(UIImage(named: "twitter")?.withRenderingMode(.automatic), for: .normal)
        buttonRight.imageView?.contentMode = .scaleToFill
        buttonRight.imageEdgeInsets = UIEdgeInsets(top: 7, left: 15, bottom: 7, right: 100)
        buttonRight.setTitleColor(.white, for: .normal)
        buttonRight.backgroundColor = .systemIndigo
        buttonRight.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        buttonRight.layer.cornerRadius = 15
        buttonRight.configuration?.imagePadding = 0
        buttonRight.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        return buttonRight
    }()
    
    private lazy var dontAccountText: UITextField = {
        let dontAccountText = UITextField()
        dontAccountText.text = "Don't have account?"
        dontAccountText.textColor = .systemPurple
        dontAccountText.font = UIFont.systemFont(ofSize: 12, weight: .light)
        dontAccountText.translatesAutoresizingMaskIntoConstraints = false
        return dontAccountText
    }()

    private lazy var signUpText: UITextField = {
        let signUpText = UITextField()
        signUpText.text = "Sign up"
        signUpText.textColor = .systemIndigo
        signUpText.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        signUpText.translatesAutoresizingMaskIntoConstraints = false
        return signUpText
    }()
    
    // MARK: - Lifcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        createGesture()
    }
    
    // MARK: - Setups
    
     private func createGesture() {
         let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
         view.addGestureRecognizer(gesture)
     }
    
    private func setupHierarchy() {
        view.addSubViews([imageView, label, emailTextField, passwordTextField, loginButton, textLabel, line, textAndLine, dontAccountText, signUpText])
        view.addSubview(stack)
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
            label.centerYAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -100),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
            line.heightAnchor.constraint(equalToConstant: 1),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -30),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
       
            buttonLeft.heightAnchor.constraint(equalToConstant: 50),
            buttonLeft.topAnchor.constraint(equalTo: stack.topAnchor, constant: 20),
            
            buttonRight.heightAnchor.constraint(equalToConstant: 50),
            buttonRight.topAnchor.constraint(equalTo: stack.topAnchor, constant: 20),
            
            textAndLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textAndLine.heightAnchor.constraint(equalToConstant: 13),
            textAndLine.widthAnchor.constraint(equalToConstant: 150),
            textAndLine.centerYAnchor.constraint(equalTo: line.centerYAnchor, constant: 0.0),
            
            dontAccountText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            dontAccountText.centerYAnchor.constraint(equalTo: buttonLeft.bottomAnchor, constant: 35),
            
            signUpText.leadingAnchor.constraint(equalTo: dontAccountText.trailingAnchor, constant: 15),
            signUpText.centerYAnchor.constraint(equalTo: buttonRight.bottomAnchor, constant: 35)
    ])
}

    // MARK: - Actions
    
    @objc private func buttonTapped() {
        let viewController = NextViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func viewTapped() {
        view.endEditing(true)
    }
}

