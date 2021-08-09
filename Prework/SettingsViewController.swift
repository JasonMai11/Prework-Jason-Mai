//
//  SettingsViewController.swift
//  Prework
//
//  Created by Jason Mai on 8/7/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var CurrencyLabel: UILabel!
    @IBOutlet weak var CurrencySegment: UISegmentedControl!
    @IBOutlet weak var CurrencyType: UILabel!
    
    let userDefaults = UserDefaults.standard
    
    let Currency_Key = "CurrencyKey"
    let USDKey = "UsdKey"
    let YENKey = "YenKey"
    let EUROKey = "EuroKey"
    var filler: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrency()
    }
    
    func updateCurrency(){
        let CKey = userDefaults.string(forKey: Currency_Key)
        if (CKey == USDKey){
            CurrencySegment.selectedSegmentIndex = 0
            filler = "USD"
        }
        else if (CKey == YENKey){
            CurrencySegment.selectedSegmentIndex = 1
            filler = "YEN"
        }
        else if (CKey == EUROKey){
            CurrencySegment.selectedSegmentIndex = 2
            filler = "EURO"
        }
        CurrencyType.text = filler
    }
    
    @IBAction func SaveSettings(_ sender: Any) {
        let information = CurrencyType.text
        let vc =  self.storyboard?.instantiateViewController(identifier: "TipCalculator") as! ViewController
        vc.data = information!
        self.navigationController?.pushViewController(vc, animated: true)
        updateCurrency()
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch CurrencySegment.selectedSegmentIndex{
        case 0:
            userDefaults.set(USDKey, forKey: Currency_Key)
        case 1:
            userDefaults.set(YENKey, forKey: Currency_Key)
        case 2:
            userDefaults.set(EUROKey, forKey: Currency_Key)
        default:
            userDefaults.set(USDKey, forKey: Currency_Key)
        }
        updateCurrency()
    }
    
    
}
