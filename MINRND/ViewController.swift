//
//  ViewController.swift
//  MINRND
//
//  Created by madhav sharma on 10/23/20.
//

import UIKit

class ViewController: UIViewController {
    
    let numbs = 0..<40
    //let operts = ["+", "–", "/", "x"]

    @IBOutlet weak var numb2: UILabel!
    @IBOutlet weak var operatorLbl: UILabel!
    @IBOutlet weak var numb1: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.layer.borderWidth = 2.0
        answer.layer.cornerRadius = 10.0
        answer.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitBtn.layer.cornerRadius = 10.0
        
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnPressed(_ sender: Any) {
        
        if let value1 = numb1.text, let corval1 = Int(value1) {
            print("\(corval1) is value 1")
            if let value2 = numb2.text, let corval2 = Int(value2) {
                print("\(corval2) is value 2")
                if let valueAnsR = answer.text, let ansR = Int(valueAnsR) {
                    print("\(ansR) is value answer")
                    let corrAns = corval1 + corval2
                    print("the correct answer is \(corrAns)")
                    if (ansR == corrAns) {
                        print("answer is correct")
                        numb2.text = String(Int.random(in: numbs))
                        numb1.text = String(Int.random(in: numbs))
                        //operatorLbl.text = String(operts.randomElement()!)
                        answer.text = ""
                        answer.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    } else {
                        print("answer is incorrect")
                        answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                    }
                } else {print("valueAns answer error")}
            } else {print("value2 numb2 error")}
        } else {print("value1 numb1 error")}
        
    }
    
}

