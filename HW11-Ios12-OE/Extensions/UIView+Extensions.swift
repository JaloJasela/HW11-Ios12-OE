//
//  File.swift
//  HW11-Ios12-OE
//
//  Created by JaloJasela on 11.02.2024.
//
import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        views.forEach { self.addSubview($0)}
    }
}

extension UITextField {
    func setLeftIcon(image: UIImage, color: UIColor) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.tintColor = color
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UITextField {
    func setRightIcon(image: UIImage, color: UIColor) {
        let iconView = UIImageView(frame: CGRect(x: 100, y: 5, width: 20, height: 20))
        iconView.tintColor = color
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 130, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
                            
extension UITextField {
    func attributedText(string: String) {
         let attributedArray: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.green]
        _ = NSAttributedString(string: string, attributes: attributedArray)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch reason {
        case .committed: print(textField.text as Any)
        @unknown default:
            fatalError("...")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
    }
}


