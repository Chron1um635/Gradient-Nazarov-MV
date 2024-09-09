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
    
    var red: CGFloat!
    var blue: CGFloat!
    var green: CGFloat!
    
    override func viewDidLoad() {
        colorfullView.layer.cornerRadius = 10
        
        redSlider.value = Float(red)
        blueSlider.value = Float(blue)
        greenSlider.value = Float(green)
        
        updateViewColor()
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
            red = CGFloat(redSlider.value)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            green = CGFloat(greenSlider.value)
        default:
            blueValueLabel.text = string(from: blueSlider)
            blue = CGFloat(blueSlider.value)
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

