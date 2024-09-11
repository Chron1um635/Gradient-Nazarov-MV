//
//  ViewController.swift
//  Gradient Nazarov MV
//
//  Created by Максим Назаров on 29.08.2024.
//

import UIKit

final class ColorViewController: UIViewController {

    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var colorfullView: UIView!
    
    @IBOutlet var redValueTextField: UITextField!
    @IBOutlet var greenValueTextField: UITextField!
    @IBOutlet var blueValueTextField: UITextField!
    
    private var red: CGFloat = 0
    private var blue: CGFloat = 0
    private var green: CGFloat = 0
    
    var mainViewColor: UIColor!
    
    weak var delegate: ColorViewControllerDelegate?
    
    override func viewDidLoad() {
        colorfullView.layer.cornerRadius = 10
        
        mainViewColor.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: nil
        )

        redSlider.value = Float(red)
        blueSlider.value = Float(blue)
        greenSlider.value = Float(green)
        
        updateViewColor()
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        
        redValueTextField.delegate = self
        greenValueTextField.delegate = self
        blueValueTextField.delegate = self
        
        redValueTextField.text = string(from: redSlider)
        greenValueTextField.text = string(from: greenSlider)
        blueValueTextField.text = string(from: blueSlider)
        
        addToolBar(redValueTextField)
        addToolBar(greenValueTextField)
        addToolBar(blueValueTextField)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
            redValueTextField.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            greenValueTextField.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
            greenValueTextField.text = string(from: greenSlider)
        }
        
        updateViewColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.updateViewColor(
            UIColor(
                red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1
            )
        )
        dismiss(animated: true)
    }
    
    
    private func updateViewColor() {
        colorfullView.backgroundColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(with title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK: - UITextFieldDelegate
extension ColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let value = Float(
            textField.text?.replacingOccurrences(
                of: ",",
                with: "."
            ) ?? ""
        ) ?? 0
        if value <= 1 {
            switch textField {
            case redValueTextField:
                redSlider.setValue(value, animated: true)
                redValueLabel.text = String(value)
                updateViewColor()
            case greenValueTextField:
                greenSlider.setValue(value, animated: true)
                greenValueLabel.text = String(value)
                updateViewColor()
            default:
                blueSlider.setValue(value, animated: true)
                blueValueLabel.text = String(value)
                updateViewColor()
            }
        } else {
            showAlert(
                with: "Введено некорректное значение",
                andMessage: "Введите значение в диапазоне 0.0...1.0"
            )
        }
    }
    
}

// MARK: - Add tool bar to text field
extension ColorViewController {
    func addToolBar(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        
        let spaceArea = UIBarButtonItem(systemItem: .flexibleSpace)
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(donePressed)
        )
        
        toolBar.setItems([spaceArea, doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(){
        view.endEditing(true)
    }
}
