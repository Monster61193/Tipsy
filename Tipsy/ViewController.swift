//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var splitValueLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    
    
    
    var tipPCT: Double = 0.10
    var billResult: Double = 0.00
    var numberOfPeople = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStepper()
    }
    
    
    @IBAction func selectTipPercentage(_ sender: UIButton) {
        let percentage = sender.currentTitle
        
        deselectButtons()
        
        sender.isSelected = true
        
        if percentage == "0%" {
            self.tipPCT = 0.00
        }else if percentage == "10%" {
            self.tipPCT = 0.10
        }else {
            self.tipPCT = 0.20
        }
    }
    
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        splitValueLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    
    @IBAction func calculateAction(_ sender: UIButton) {
        let bill = billLabel.text!
        if bill != "" {
            billResult = calculateTip(billAmount: Double(bill)!, tipPercentage: tipPCT, numberOfPeople: numberOfPeople)
            performSegue(withIdentifier: "calculateTip", sender: self)
        }
    }
    
    
    func calculateTip(billAmount: Double, tipPercentage: Double, numberOfPeople: Int) -> Double {
        return  (billAmount * tipPercentage) / Double(numberOfPeople)
    }
    
    func configureStepper() {
        stepper.value = 2
        stepper.minimumValue = 1
        stepper.maximumValue = 25
        stepper.stepValue = 1
    }
    
    func deselectButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "calculateTip" {
            let destination = segue.destination as! TipResultViewController
            destination.tipResultText = String(format: "%.2f", billResult)
            destination.tipPC = Int(tipPCT * 100)
            destination.numberOfPeople = numberOfPeople
            
            
        }
        
    }
    
}

