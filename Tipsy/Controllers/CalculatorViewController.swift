//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipPercentage = 0.0
    var splitNumber = 2.0
    var totalBill = 0.0
    var resultTo2DecimalPlaces = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        //Deselect all tip buttons via IBOutlets
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //Make the button that triggered the IBAction selected.
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tipPercentage = buttonTitleAsANumber / 100
        
//        MY CODE!!!!!!!!
        //        if sender.currentTitle! == "0%" {
        //            zeroPctButton.isSelected = true
        //            tenPctButton.isSelected = false
        //            twentyPctButton.isSelected = false
        //            tipPercentage = 0
        //        } else if sender.currentTitle! == "10%" {
        //            zeroPctButton.isSelected = false
        //            tenPctButton.isSelected = true
        //            twentyPctButton.isSelected = false
        //            tipPercentage = 0.1
        //        } else {
        //            zeroPctButton.isSelected = false
        //            tenPctButton.isSelected = false
        //            twentyPctButton.isSelected = true
        //            tipPercentage = 0.2
        //        }
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = sender.value
        splitNumberLabel.text = String(format: "%.0f", splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
                //Get the text the user typed in the billTextField
                let bill = billTextField.text!
        
                //If the text is not an empty String ""
                if bill != "" {
        
                    //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
                    //e.g. 125.50
                    totalBill = Double(bill)!
        
                    //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
                    let result = totalBill * (1 + tipPercentage) / Double(splitNumber)
        
                    //Round the result to 2 decimal places and turn it into a String.
                    resultTo2DecimalPlaces = String(format: "%.2f", result)
                    
                    self.performSegue(withIdentifier: "goToResult", sender: self)
                }
        
//        MY CODE!!!!!!!!
//        if billTextField.text! != "" {
//            let billText = billTextField.text!
//            totalBill = Double(billText)!
//
//            print(tipPercentage)
//            print(splitNumber)
//            print(totalBill)
//
//            let splitBill = totalBill * (1 + tipPercentage) / splitNumber
//            print(String(format: "%.2f", splitBill))
//        }

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.personNumber = Int(splitNumber)
            destinationVC.tip = Int(tipPercentage * 100)
            destinationVC.billPerPerson = resultTo2DecimalPlaces
        }
    }
    
    
}

