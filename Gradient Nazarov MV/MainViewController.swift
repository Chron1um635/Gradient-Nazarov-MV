//
//  MainViewController.swift
//  Gradient Nazarov MV
//
//  Created by Максим Назаров on 09.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var red: CGFloat = 0
    var blue: CGFloat = 0
    var green: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor?.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: nil
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as? ColorViewController
        colorVC?.red = red
        colorVC?.blue = blue
        colorVC?.green = green
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let colorVC = segue.source as? ColorViewController
        red = colorVC?.red ?? 0
        blue = colorVC?.blue ?? 0
        green = colorVC?.green ?? 0
        
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}
