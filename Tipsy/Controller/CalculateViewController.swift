//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tipsyBrain = TipsyBrain()
    
    @IBOutlet var selectTip0: UIButton!
    @IBOutlet var selectTip10: UIButton!
    @IBOutlet var selectTip20: UIButton!
    @IBOutlet var labelPersons: UILabel!
    
    
    @IBOutlet var labelBillCoast: UITextField!
    var tip = 0.10
 
    @IBAction func pressedSplit(_ sender: UIStepper) {
        
        labelPersons.text = String(format: "%.0f",  sender.value)
    }
    
    @IBAction func pressedCalculate(_ sender: UIButton) {
        let billValue = labelBillCoast.text ?? "0"
        let totalPersons =  labelPersons.text ?? "2"
        
        
        tipsyBrain.calcuteTip(bill: billValue, persons: totalPersons, calculateTip: tip)
        
        performSegue(withIdentifier: "goToResultsBills", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Definido um identifier "goToResult" para conseguir trabalhar com a view de result
        if segue.identifier == "goToResultsBills" {
            // aqui eu defino que eu quero a classe ResultViewController e nao UIViewController para conseguir pegar os dados dentro. Também chamado de DownCasting a exclamacao diz que é forçadamente esse casting

            let destinationVC = segue.destination as! ResultTotalViewController
            // Nesta linha de código eu adiciono o caminho da ResultViewController e envio o resultado do calculo da BMI para variavel dentro da RVC
           
            destinationVC.totalCoast =  tipsyBrain.getCoastTotal()
            destinationVC.totalPerson = tipsyBrain.getTotalPersons()
            destinationVC.percentTipSelected = String(tipsyBrain.getPercentTip())
            
        }
    }
    
    @IBAction func pressedTipZero(_ sender: UIButton) {
        
        labelBillCoast.endEditing(true)
        selectTip0.isSelected = false
        selectTip10.isSelected = false
        selectTip20.isSelected = false
        sender.isSelected = true
        
        let getTipValue = sender.currentTitle!
        let tipMinusPercent = String(getTipValue.dropLast())
        let percentTipConvertedToDouble = Double(tipMinusPercent)!

        
         tip = percentTipConvertedToDouble / 100
    }
    
   
    
}

