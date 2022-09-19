//
//  ViewController.swift
//  TipCalculator
//
//  Created by Сергей Кудинов on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var finalTipLabel: UILabel!
    @IBOutlet weak var totalPaymentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)

        setupSlider(slider: percentSlider)
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderAction() {
        if (checkTextField(textField: amountTextField)) {
            let sliderValue = percentSlider.value
            tipPercentLabel.text = String(Int(sliderValue)) + "%"
            
            let amount = amountTextField.text
            let newAmount = Int(amount!)
            finalTipLabel.text = calculateTip(tipPercent: Int(sliderValue), amount: newAmount!)
            
            let final = Double(calculateTip(tipPercent: Int(sliderValue), amount: newAmount!))! + Double(newAmount!)
            totalPaymentLabel.text = String(NSString(format: "%.2f", final))
        }
    }

    @IBAction func textFieldChanged() {
        let sliderValue = percentSlider.value
        tipPercentLabel.text = String(Int(sliderValue)) + "%"
        
        let amount = amountTextField.text
        let newAmount = Int(amount!)
        finalTipLabel.text = calculateTip(tipPercent: Int(sliderValue), amount: newAmount!)
        
        let final = Double(calculateTip(tipPercent: Int(sliderValue), amount: newAmount!))! + Double(newAmount!)
        totalPaymentLabel.text = String(NSString(format: "%.2f", final))
    }
        
    

}

extension ViewController {
    func checkTextField(textField: UITextField) -> Bool{
        if ((textField.text == nil) || (textField.text == "")) {
            let alert = UIAlertController(title: "Пустое поле", message: "Поле не должно быть пустым", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in}))
            self.present(alert, animated: true, completion: nil)
            return false
        } else {
            return true
        }
    }
    
    func setupSlider(slider: UISlider) {
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 50
    }
    
    func calculateTip(tipPercent: Int, amount: Int) -> String{
        let tip = Double(amount) / 100 * Double(tipPercent)
        return String(NSString(format: "%.2f", tip))

    }
    
    @objc func editingChanged(_ textField: UITextField) {
            //текст изменился
        }
}
