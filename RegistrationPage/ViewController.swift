//
//  ViewController.swift
//  RegistrationPage
//
//  Created by Justin Hold on 9/24/23.
//

import UIKit

// QUESTIONS FOR MALLI:

// For checking password character length and complexity, do I need to combine that in one single function or is it better to make them two different ones?

class ViewController: UIViewController, UITextFieldDelegate {
	
	
	@IBOutlet weak var nameTextField: UITextField!
	
	@IBOutlet weak var emailField: UITextField!
	
	@IBOutlet weak var passwordField: UITextField!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		nameTextField.delegate = self
		passwordField.delegate = self
		passwordField.isSecureTextEntry = true
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		validateNameLength()
		return true
	}
	
	// Check name text field for min/max character length
	func validateNameLength() {
		
		// Define the minimum and maximum character lengths
		let minLength = 5
		let maxLength = 20

		// Get the current text in the text field
		if let name = nameTextField.text {
			if name.count < minLength || name.count > maxLength {
				showErrorAlert(message: "Name must be between \(minLength) and \(maxLength) characters.")
			}
		}
	}
	
	// Check complexity of password
	private func passwordCheck(
		_ textField: UITextField,
		shouldChangeCharactersIn range: NSRange,
		replacementString string: String
	) -> Bool {
		
		let minLength = 8
		let maxLength = 20
		
		let currentText = textField.text ?? ""
		
		let newText = (currentText as NSString).replacingCharacters(
			in: range,
			with: string
		)
		
		if newText.count < minLength || newText.count > maxLength {
			showErrorAlert(message: "Password must be at least \(minLength) to \(maxLength) characters long.")
			return false
		}
		return true
	}
	
	// Alert for name text field validation
	func showErrorAlert(message: String) {
		let alert = UIAlertController(
			title: "Validation Error",
			message: message,
			preferredStyle: .alert
		)
		alert.addAction(UIAlertAction(
			title: "OK",
			style: .default,
			handler: nil
		))
		present(alert, animated: true, completion: nil)
	}
}

