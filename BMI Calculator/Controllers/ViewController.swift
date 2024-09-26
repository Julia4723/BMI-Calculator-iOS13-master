//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var sliderWeight: UISlider!
    @IBOutlet weak var sliderHeight: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightLabel.text = "0m"
        weightLabel.text = "0Kg"
    }


    @IBAction func sliderHeightChanged(_ sender: UISlider) {
        let height = (String(format: "%.2f", sender.value))
        heightLabel.text = "\(height)m"
    }
    
    
    @IBAction func sliderWeightChanged(_ sender: UISlider) {
        let weight = (String(format: "%.0f", sender.value))
        weightLabel.text = "\(weight)Kg"

    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = sliderHeight.value
        let weight = sliderWeight.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
     
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
           // destinationVC.adviceLabel = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

