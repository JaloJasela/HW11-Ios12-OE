
import UIKit

class ViewController: UIViewController {

    // MARK: - UI
    
    private lazy var gradient: UIImageView = {
        let image = UIImage(named: "Gradient")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Inits
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(gradient)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            gradient.topAnchor.constraint(equalTo: view.topAnchor),
            gradient.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradient.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradient.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

