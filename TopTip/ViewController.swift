//
//  ViewController.swift
//  TopTip
//
//  Created by Gabriel Allen on 7/28/16.
//  Copyright © 2016 Gabriel Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalAmountField: UITextField!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var billAmountField: UITextField!
   
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func calculateTip(sender: AnyObject) {
        // checking if a double is in billAmountField
        // if so, assign to billamount
        // else fill blanks, return
        guard let billAmount = Double(billAmountField.text!) else {
            // error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            return
        }
    var tipPercentage: Double = 0.0
    
        // for tip %
    switch tipSelector.selectedSegmentIndex {
    case 0 :
        tipPercentage = 0.0
    case 1:
        tipPercentage = 0.10
    case 2:
        tipPercentage = 0.20
    default:
        break
    }
        let roundedBillAmount = round(100*billAmount) / 100
        let tipAmount = roundedBillAmount  * tipPercentage
        let roundedTipAmount = round(100*tipAmount) / 100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        // if the billAmountField is not being edited
        if (!billAmountField.editing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
        
    

    }
}


