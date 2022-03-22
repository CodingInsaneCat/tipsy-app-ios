//
//  ResultTotalViewController.swift
//  Tipsy
//
//  Created by Giovanni on 21/03/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultTotalViewController: UIViewController {

   
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var settingsLabel: UILabel!
    
    var totalCoast: String?
    var totalPerson: String?
    var percentTipSelected: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateCoast()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateCoast(){
        totalLabel.text = "\(totalCoast!)$"
        settingsLabel.text = "Split between \(totalPerson!) people, with \(percentTipSelected!)% tip."
    }

}
