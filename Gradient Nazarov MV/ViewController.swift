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
    
    @IBAction func redSliderChange() {
        redValueLabel.text = (round(redSlider.value * 100) / 100).formatted()
        updateViewColor()
    }

    @IBAction func greenSliderChange() {
        greenValueLabel.text = (round(greenSlider.value * 100) / 100).formatted()
        updateViewColor()
    }

    @IBAction func blueSliderChange() {
        blueValueLabel.text = (round(blueSlider.value * 100) / 100).formatted()
        updateViewColor()
    }
    
    private func updateViewColor() {
        colorfullView.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}

