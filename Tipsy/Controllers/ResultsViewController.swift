//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 石川大輔 on 2021/03/03.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var personNumber: Int?
    var tip: Int?
    var billPerPerson: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = billPerPerson ?? ""
        
        settingsLabel.text = "Split between \(personNumber ?? 0) people, with \(tip ?? 0) tip."

    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
