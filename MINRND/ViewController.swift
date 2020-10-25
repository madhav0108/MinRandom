//
//  ViewController.swift
//  MINRND
//
//  Created by madhav sharma on 10/23/20.
//

import UIKit

class ViewController: UIViewController {
    
    let numbs = 0..<40
    let numbsForX = 0..<13
    let numbsForD = 1..<11
    let operts = ["+", "-", "x", "/"]

    @IBOutlet weak var numb2: UILabel!
    @IBOutlet weak var operatorLbl: UILabel!
    @IBOutlet weak var numb1: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.layer.borderWidth = 2.0
        answer.layer.cornerRadius = 10.0
        answer.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        submitBtn.layer.cornerRadius = 10.0
        
        let a = Int.random(in: numbs)
        //let aForX = Int.random(in: numbsForX)
        let b = Int.random(in: numbs)
        //let bForX = Int.random(in: numbsForX)
        operatorLbl.text = String(operts.randomElement()!)
        //print("\(operatorLbl.text)")
        if operatorLbl.text == "+" {
            numb2.text = String(Int.random(in: numbs))
            numb1.text = String(Int.random(in: numbs))
        }
        if operatorLbl.text == "-" {
            if a >= b {
                numb2.text = String(b)
                numb1.text = String(a)
            } else {
                numb2.text = String(a)
                numb1.text = String(b)
            }
        }
        if operatorLbl.text == "x" {
            numb2.text = String(Int.random(in: numbsForX))
            numb1.text = String(Int.random(in: numbsForX))
        }
        if operatorLbl.text == "/" {
            let aD = Int.random(in: numbsForD)
            numb2.text = String(aD)
            let bD = Int.random(in: numbsForD)
            let cD = aD*bD
            numb1.text = String(cD)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnPressed(_ sender: Any) {
        
        ogLoop: if let value1 = numb1.text, let corval1 = Int(value1) {
            print("\(corval1) is value 1")
            if let value2 = numb2.text, let corval2 = Int(value2) {
                print("\(corval2) is value 2")
                if let valueAnsR = answer.text, let ansR = Int(valueAnsR) {
                    print("\(ansR) is value answer")
                    opertLoop: if (operatorLbl.text == "+") {
                        let corrAns = minSum(num1: corval1, num2: corval2) 
                        print("the correct answer is \(corrAns)")
                        ifIncorrect: if (ansR == corrAns) {
                            print("answer is correct")
                            answer.text = ""
                            answer.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            let a = Int.random(in: numbs)
                            print("\(a)")
                            let b = Int.random(in: numbs)
                            print("\(b)")
                            operatorLbl.text = String(operts.randomElement()!)
                            //print("\(operatorLbl.text)")
                            if operatorLbl.text == "+" {
                                numb2.text = String(Int.random(in: numbs))
                                numb1.text = String(Int.random(in: numbs))
                                break ogLoop
                            }
                            if operatorLbl.text == "-" {
                                if a >= b {
                                    numb2.text = String(b)
                                    numb1.text = String(a)
                                    break ogLoop
                                } else {
                                    numb2.text = String(a)
                                    numb1.text = String(b)
                                    break ogLoop
                                }
                            }
                            if operatorLbl.text == "x" {
                                numb2.text = String(Int.random(in: numbsForX))
                                numb1.text = String(Int.random(in: numbsForX))
                                break ogLoop
                            }
                            if operatorLbl.text == "/" {
                                let aD = Int.random(in: numbsForD)
                                numb2.text = String(aD)
                                let bD = Int.random(in: numbsForD)
                                let cD = aD*bD
                                numb1.text = String(cD)
                                break ogLoop
                            }
                        } else {
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                    opertLoop: if (operatorLbl.text == "-") {
                        let corrAns = minDiff(num1: corval1, num2: corval2)
                        print("the correct answer is \(corrAns)")
                        ifIncorrect: if (ansR == corrAns) {
                            print("answer is correct")
                            answer.text = ""
                            answer.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            let a = Int.random(in: numbs)
                            print("\(a)")
                            let b = Int.random(in: numbs)
                            print("\(b)")
                            operatorLbl.text = String(operts.randomElement()!)
                            //print("\(operatorLbl.text)")
                            if operatorLbl.text == "+" {
                                numb2.text = String(Int.random(in: numbs))
                                numb1.text = String(Int.random(in: numbs))
                                break ogLoop
                            }
                            if operatorLbl.text == "-" {
                                if a >= b {
                                    numb2.text = String(b)
                                    numb1.text = String(a)
                                    break ogLoop
                                } else {
                                    numb2.text = String(a)
                                    numb1.text = String(b)
                                    break ogLoop
                                }
                            }
                            if operatorLbl.text == "x" {
                                numb2.text = String(Int.random(in: numbsForX))
                                numb1.text = String(Int.random(in: numbsForX))
                                break ogLoop
                            }
                            if operatorLbl.text == "/" {
                                let aD = Int.random(in: numbsForD)
                                numb2.text = String(aD)
                                let bD = Int.random(in: numbsForD)
                                let cD = aD*bD
                                numb1.text = String(cD)
                                break ogLoop
                            }
                        } else {
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                    opertLoop: if (operatorLbl.text == "/") {
                        let corrAns = minDiv(num1: corval1, num2: corval2)
                        print("the correct answer is \(corrAns)")
                        ifIncorrect: if (ansR == corrAns) {
                            print("answer is correct")
                            answer.text = ""
                            answer.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            let a = Int.random(in: numbs)
                            print("\(a)")
                            let b = Int.random(in: numbs)
                            print("\(b)")
                            operatorLbl.text = String(operts.randomElement()!)
                            //print("\(operatorLbl.text)")
                            if operatorLbl.text == "+" {
                                numb2.text = String(Int.random(in: numbs))
                                numb1.text = String(Int.random(in: numbs))
                                break ogLoop
                            }
                            if operatorLbl.text == "-" {
                                if a >= b {
                                    numb2.text = String(b)
                                    numb1.text = String(a)
                                    break ogLoop
                                } else {
                                    numb2.text = String(a)
                                    numb1.text = String(b)
                                    break ogLoop
                                }
                            }
                            if operatorLbl.text == "x" {
                                numb2.text = String(Int.random(in: numbsForX))
                                numb1.text = String(Int.random(in: numbsForX))
                                break ogLoop
                            }
                            if operatorLbl.text == "/" {
                                let aD = Int.random(in: numbsForD)
                                numb2.text = String(aD)
                                let bD = Int.random(in: numbsForD)
                                let cD = aD*bD
                                numb1.text = String(cD)
                                break ogLoop
                            }
                        } else {
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                    opertLoop: if (operatorLbl.text == "x") {
                        let corrAns = minPrd(num1: corval1, num2: corval2)
                        print("the correct answer is \(corrAns)")
                        ifIncorrect: if (ansR == corrAns) {
                            print("answer is correct")
                            answer.text = ""
                            answer.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            let a = Int.random(in: numbs)
                            print("\(a)")
                            let b = Int.random(in: numbs)
                            print("\(b)")
                            operatorLbl.text = String(operts.randomElement()!)
                            //print("\(operatorLbl.text)")
                            if operatorLbl.text == "+" {
                                numb2.text = String(Int.random(in: numbs))
                                numb1.text = String(Int.random(in: numbs))
                                break ogLoop
                            }
                            if operatorLbl.text == "-" {
                                if a >= b {
                                    numb2.text = String(b)
                                    numb1.text = String(a)
                                    break ogLoop
                                } else {
                                    numb2.text = String(a)
                                    numb1.text = String(b)
                                    break ogLoop
                                }
                            }
                            if operatorLbl.text == "x" {
                                numb2.text = String(Int.random(in: numbsForX))
                                numb1.text = String(Int.random(in: numbsForX))
                                break ogLoop
                            }
                            if operatorLbl.text == "/" {
                                let aD = Int.random(in: numbsForD)
                                numb2.text = String(aD)
                                let bD = Int.random(in: numbsForD)
                                let cD = aD*bD
                                numb1.text = String(cD)
                                break ogLoop
                            }
                        } else {
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                } else {print("valueAns answer error")}
            } else {print("value2 numb2 error")}
        } else {print("value1 numb1 error")}
        
    }
    @IBAction func skipBtnPressed(_ sender: Any) {
        let a = Int.random(in: numbs)
        //let aForX = Int.random(in: numbsForX)
        let b = Int.random(in: numbs)
        //let bForX = Int.random(in: numbsForX)
        operatorLbl.text = String(operts.randomElement()!)
        //print("\(operatorLbl.text)")
        if operatorLbl.text == "+" {
            numb2.text = String(Int.random(in: numbs))
            numb1.text = String(Int.random(in: numbs))
        }
        if operatorLbl.text == "-" {
            if a >= b {
                numb2.text = String(b)
                numb1.text = String(a)
            } else {
                numb2.text = String(a)
                numb1.text = String(b)
            }
        }
        if operatorLbl.text == "x" {
            numb2.text = String(Int.random(in: numbsForX))
            numb1.text = String(Int.random(in: numbsForX))
        }
        if operatorLbl.text == "/" {
            let aD = Int.random(in: numbsForD)
            numb2.text = String(aD)
            let bD = Int.random(in: numbsForD)
            let cD = aD*bD
            numb1.text = String(cD)
        }
    }
    
    func minSum (num1: Int, num2: Int)->Int {
        return num1 + num2
    }
    func minDiff (num1: Int, num2: Int)->Int {
        return num1 - num2
    }
    func minDiv (num1: Int, num2: Int)->Int {
        return num1 / num2
    }
    func minPrd (num1: Int, num2: Int)->Int {
        return num1 * num2
    }
    
}

