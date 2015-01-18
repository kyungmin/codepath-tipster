//
//  ViewController.swift
//  Tipster
//
//  Created by Kyungmin Kim on 1/17/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex];
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        UIView.animateWithDuration(0.4, animations: {
            self.billField.alpha = 1
            self.billField.alpha = 0.5
        })
    }
    @IBAction func onEdit(sender: UITextField) {
        UIView.animateWithDuration(0.4, animations: {
            self.billField.alpha = 0.5
            self.billField.alpha = 1
        })
    }
}

