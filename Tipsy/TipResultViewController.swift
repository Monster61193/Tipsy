//
//  TipResult.swift
//  Tipsy
//
//  Created by Adrian Dardon Flores on 30/01/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit


class TipResultViewController:UIViewController {
    
    @IBOutlet weak var tipResultLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var tipResultText:String!
    var tipPC:Int!
    var numberOfPeople:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    @IBAction func recalculateTip(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    func setupView() {
        tipResultLabel.text = tipResultText
        if numberOfPeople == 1 {
            detailsLabel.text = "Full bill with \(tipPC!)% tip (not split)."
        }else {
            detailsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPC!)% tip."
        }
        
    }
    
}
