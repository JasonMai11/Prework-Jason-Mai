//
//  ViewController.swift
//  Prework
//
//  Created by Jason Mai on 8/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var PercentageTipSlide: UILabel!
    @IBOutlet weak var SliderControl: UISlider!
    @IBOutlet weak var CurrencySign: UILabel!
    
    @IBOutlet weak var ConversionSign: UILabel!
    @IBOutlet weak var ConversionEquation: UILabel!
    
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
        billAmountTextField.becomeFirstResponder()
            
        CurrencySign.text = data
        if (data == "YEN"){
            ConversionSign.text = "¥"
        }
        else if (data == "USD"){
            ConversionSign.text = "$"
        }
        else if (data == "EURO"){
            ConversionSign.text = "€"
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        ConversionEquation.text = billAmountTextField.text
        let bill = Double(billAmountTextField.text!) ?? 0
    
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [15, 18, 20]
        var Amount = 0
        Amount = Int(tipPercentages[tipControl.selectedSegmentIndex])
        let tip = bill * (Double(Amount) * 0.01)
        
        let total = bill + tip
        
        if CurrencySign.text == "USD"{
            ConversionEquation.text = billAmountTextField.text
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format:"$%.2f", total)
        }
        else if CurrencySign.text == "YEN"{
            let YENWin = String(bill * 110.28)
            ConversionEquation.text = YENWin
            let YENtip = Double(YENWin)! * (Double(Amount) * 0.01)
            let YENmoney = total + YENtip
            // Update Tip Amount Label
            tipAmountLabel.text = String(format: "¥%.2f", YENtip)
            totalLabel.text = String(format:"¥%.2f", YENmoney)
        }
        else if CurrencySign.text == "EURO"{
            let EUROWin = String(bill * 0.85)
            ConversionEquation.text = EUROWin
            let EUROtip = Double(EUROWin)! * (Double(Amount) * 0.01)
            let EUROmoney = total + EUROtip
            // Update Tip Amount Label
            tipAmountLabel.text = String(format: "€%.2f", EUROtip)
            totalLabel.text = String(format:"€%.2f", EUROmoney)
        }
        else{
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        }
        // Update tip Percentage label
        SliderControl.setValue(Float(Amount), animated: true)
        PercentageTipSlide.text = String(Amount) + "%"
    }
    
    
    @IBAction func SliderMovement(_ sender: UISlider) {
        // Makes Sure that it grabs the Sliders Value in Integers
        var Amount = 0
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.20]
        if tipPercentages[tipControl.selectedSegmentIndex] == 0.15{
            Amount = 15
            PercentageTipSlide.text = "15%"
        }
        else if tipPercentages[tipControl.selectedSegmentIndex] == 0.18{
            Amount = 18
            PercentageTipSlide.text = "18%"
        }
        else if tipPercentages[tipControl.selectedSegmentIndex] == 0.20{
            Amount = 20
            PercentageTipSlide.text = "20%"
        }
        
        Amount = Int(sender.value)
        
        // Multiplying by 0.01 so it can be in Percent form
        let tips = Double(Amount) * 0.01
        let tip = (Double(Amount) * 0.01) * bill
        
        // total
        let total = bill + tip
        
        if CurrencySign.text == "USD"{
            ConversionEquation.text = String(bill)
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format:"$%.2f", total)
        }
        else if CurrencySign.text == "YEN"{
            let YENWin = String(bill * 110.28)
            ConversionEquation.text = YENWin
            let YENtip = tips * Double(YENWin)!
            let YENmoney = total + YENtip
            // Update Tip Amount Label
            tipAmountLabel.text = String(format: "¥%.2f", YENtip)
            totalLabel.text = String(format:"¥%.2f", YENmoney)
        }
        else if CurrencySign.text == "EURO"{
            let EUROWin = String(bill * 0.85)
            ConversionEquation.text = EUROWin
            let EUROtip = tips * Double(EUROWin)!
            let EUROmoney = total + EUROtip
            // Update Tip Amount Label
            tipAmountLabel.text = String(format: "€%.2f", EUROtip)
            totalLabel.text = String(format:"€%.2f", EUROmoney)
        }
        else{
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        }
        // Update tip Percentage label
        SliderControl.setValue(Float(Amount), animated: true)
        PercentageTipSlide.text = String(Amount) + "%"
        
    }
    
}

