//
//  ViewController.swift
//  Gradient Nazarov MV
//
//  Created by Максим Назаров on 29.08.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var colorfullView: UIView!
    
    override func viewDidLoad() {
        colorfullView.layer.cornerRadius = 10
        updateViewColor()
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
        
        updateViewColor()
        
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
    
}

