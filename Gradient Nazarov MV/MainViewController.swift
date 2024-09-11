//
//  MainViewController.swift
//  Gradient Nazarov MV
//
//  Created by Максим Назаров on 09.09.2024.
//

import UIKit

protocol ColorViewControllerDelegate: AnyObject {
    func updateViewColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as? ColorViewController
        colorVC?.delegate = self
        colorVC?.mainViewColor = view.backgroundColor
    }
    
}

// MARK: - ColorViewControllerDelegate
extension MainViewController: ColorViewControllerDelegate {
    func updateViewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
