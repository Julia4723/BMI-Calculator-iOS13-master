//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by user on 26.09.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
  
    mutating func calculateBMI (height : Float, weight : Float) {
       let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more", color: .systemBlue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Normal", color: .systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less", color: .systemRed)
        }
        
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .red
    }
    
    func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValue
    }
    
}
