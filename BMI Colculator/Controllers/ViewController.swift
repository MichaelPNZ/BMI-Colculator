//
//  ViewController.swift
//  BMI Colculator
//
//  Created by Михаил Позялов on 29.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func valueSlider(_ sender: UISlider) {
        switch sender {
        case heightSlider:
            heightLabel.text = "\(String(format:"%.2f", sender.value))m"
            print(sender.value)
        default:
            weightLabel.text = "\(Int(sender.value))Kg"
            print(sender.value)
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        let bmi = weight / pow(height, 2)
        
       let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%0.1f)", bmi)
        
        self.present(secondVC, animated: true)
    }
}

