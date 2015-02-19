//
//  ViewController.swift
//  TipCalc
//
//  Created by Matthew Brightbill on 2/19/15.
//  Copyright (c) 2015 Matthew Brightbill. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    
    let tipCalc = TipCalc(amountBeforeTax: 25.00, tipPercentage: 0.2)
    var textFields: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.amountBeforeTaxTextField.delegate = self
        self.tipPercentageTextField.delegate = self
        
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
        tipPercentageTextField.text = String(format: "%0.2f", arguments: [tipCalc.tipPercentage])
        textFields = [amountBeforeTaxTextField, tipPercentageTextField]
    }
    
    func calcTip() {
        tipCalc.tipPercentage = (tipPercentageTextField.text as NSString).floatValue
        tipCalc.amountBeforeTax = (amountBeforeTaxTextField.text as NSString).floatValue
        tipCalc.calculateTip()
        resultsLabel.text = String(format: "Your tip: %0.2f.", arguments: [tipCalc.tipAmount])
    }
    
    
    @IBAction func calculatePressed(sender: AnyObject) {
        self.calcTip()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let textFieldArray = textFields as NSArray
        let i = textFieldArray.indexOfObject(textField)
        if i < textFieldArray.count - 1 {
            let newTextField = textFieldArray[i+1] as UITextField
            newTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            self.calcTip()
        }
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

