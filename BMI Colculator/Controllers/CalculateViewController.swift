//
//  ViewController.swift
//  BMI Colculator
//
//  Created by Михаил Позялов on 29.01.2023.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var currentBMI: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func valueSlider(_ sender: UISlider) {
        switch sender {
        case heightSlider:
            heightLabel.text = "\(String(format:"%.2f", sender.value))m"
        default:
            weightLabel.text = "\(Int(sender.value))Kg"
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {

        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVS = segue.destination as? ResultViewController
            destinationVS?.bmiValue = calculatorBrain.getBMIValue()
            destinationVS?.advice = calculatorBrain.getAdvice()
            destinationVS?.color = calculatorBrain.getColor()
            
        }
    }
}

