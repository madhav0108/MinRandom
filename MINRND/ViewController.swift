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
    var operts = ["+", "-", "x", "/"]
    var currScore = 0
    var highScore = 0
    
    var timer: Timer!
    var aT = 5
    //default value for ice or fire segmented control set to 0 (ice)
    var iceOrFireMode = 0

    @IBOutlet weak var currScoreLbl: UILabel!
    @IBOutlet weak var highScoreLbl: UILabel!
    @IBOutlet weak var numb2: UILabel!
    @IBOutlet weak var operatorLbl: UILabel!
    @IBOutlet weak var numb1: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    @IBOutlet weak var addOnlyBtn: UIButton!
    @IBOutlet weak var subOnlyBtn: UIButton!
    @IBOutlet weak var multpOnlyBtn: UIButton!
    @IBOutlet weak var divOnlyBtn: UIButton!
    @IBOutlet weak var rndAnyBtn: UIButton!
    
    @IBOutlet weak var timeLeftLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answer.layer.borderWidth = 2.0
        answer.layer.cornerRadius = 5.0
        answer.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        submitBtn.layer.cornerRadius = 10.0
        
        skipBtn.isHidden = false
        answer.rightViewMode = UITextField.ViewMode.always
        answer.rightView = skipBtn
        
        highScoreLbl.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        
        currScoreLbl.text = String(0)
        highScoreLbl.text = String(0)
        
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
        iceOrFireMode = 0
        currScoreLbl.isHidden = true
        highScoreLbl.isHidden = true
        timeLeftLbl.isHidden = true
        rndAnyBtn.isHidden = true
        multpOnlyBtn.isHidden = true
        addOnlyBtn.isHidden = true
        subOnlyBtn.isHidden = true
        divOnlyBtn.isHidden = true
    }
    
    @objc func updateTimeLeft() {
        aT = Int(timeLeftLbl.text!)!
        if aT > 0 {
            aT -= 1
            timeLeftLbl.text = String(aT)
        }
        if aT == 0 {
            skipBtnPressed(self)
            currScore = 0
            currScoreLbl.text = String(currScore)
            aT = 5
            timeLeftLbl.text = String(aT)
        }
    }
    
    @IBAction func iceOrFireModeControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            iceOrFireMode = 0
            timer.invalidate()
            currScoreLbl.isHidden = true
            highScoreLbl.isHidden = true
            timeLeftLbl.isHidden = true
            rndAnyBtn.isHidden = true
            multpOnlyBtn.isHidden = true
            addOnlyBtn.isHidden = true
            subOnlyBtn.isHidden = true
            divOnlyBtn.isHidden = true
        case 1:
            iceOrFireMode = 1
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLeft), userInfo: nil, repeats: true)
            currScoreLbl.isHidden = false
            highScoreLbl.isHidden = false
            timeLeftLbl.isHidden = false
            rndAnyBtn.isHidden = false
            multpOnlyBtn.isHidden = false
            addOnlyBtn.isHidden = false
            subOnlyBtn.isHidden = false
            divOnlyBtn.isHidden = false
            skipBtnPressed(self)
            aT = 5
            timeLeftLbl.text = String(aT)
            currScore = 0
            currScoreLbl.text = String(currScore)
        default:
            break
        }
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
                            currScore += 1
                            currScoreLbl.text = String(currScore)
                            if (iceOrFireMode == 1) {
                                if (currScore > highScore) {
                                    highScore = currScore
                                    highScoreLbl.text = String(highScore)
                                }
                            }
                            aT = 5
                            timeLeftLbl.text = String(aT)
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
                            currScore = 0
                            currScoreLbl.text = String(currScore)
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                    opertLoop: if (operatorLbl.text == "-") {
                        let corrAns = minDiff(num1: corval1, num2: corval2)
                        print("the correct answer is \(corrAns)")
                        ifIncorrect: if (ansR == corrAns) {
                            currScore += 1
                            currScoreLbl.text = String(currScore)
                            if (iceOrFireMode == 1) {
                                if (currScore > highScore) {
                                    highScore = currScore
                                    highScoreLbl.text = String(highScore)
                                }
                            }
                            aT = 5
                            timeLeftLbl.text = String(aT)
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
                            currScore = 0
                            currScoreLbl.text = String(currScore)
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                    opertLoop: if (operatorLbl.text == "/") {
                        let corrAns = minDiv(num1: corval1, num2: corval2)
                        print("the correct answer is \(corrAns)")
                        ifIncorrect: if (ansR == corrAns) {
                            currScore += 1
                            currScoreLbl.text = String(currScore)
                            if (iceOrFireMode == 1) {
                                if (currScore > highScore) {
                                    highScore = currScore
                                    highScoreLbl.text = String(highScore)
                                }
                            }
                            aT = 5
                            timeLeftLbl.text = String(aT)
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
                            currScore = 0
                            currScoreLbl.text = String(currScore)
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                    opertLoop: if (operatorLbl.text == "x") {
                        let corrAns = minPrd(num1: corval1, num2: corval2)
                        print("the correct answer is \(corrAns)")
                        ifIncorrect: if (ansR == corrAns) {
                            currScore += 1
                            currScoreLbl.text = String(currScore)
                            if (iceOrFireMode == 1) {
                                if (currScore > highScore) {
                                    highScore = currScore
                                    highScoreLbl.text = String(highScore)
                                }
                            }
                            aT = 5
                            timeLeftLbl.text = String(aT)
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
                            currScore = 0
                            currScoreLbl.text = String(currScore)
                            print("answer is incorrect")
                            answer.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                        }
                    }
                } else {print("valueAns answer error")}
            } else {print("value2 numb2 error")}
        } else {print("value1 numb1 error")}
        
    }
    @IBAction func skipBtnPressed(_ sender: Any) {
        if (currScore <= 5) {
            currScore = 0
            currScoreLbl.text = String(currScore)
        }
        if (currScore > 5 && currScore <= 25) {
            currScore -= 5
            currScoreLbl.text = String(currScore)
        }
        if (currScore > 25 && currScore <= 50) {
            currScore -= 7
            currScoreLbl.text = String(currScore)
        }
        if (currScore > 50 && currScore <= 100) {
            currScore -= 10
            currScoreLbl.text = String(currScore)
        }
        if (currScore > 100) {
            currScore -= 20
            currScoreLbl.text = String(currScore)
        }
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
    
    @IBAction func addOnlyBtnPressed(_ sender: Any) {
        operts = ["+"]
        skipBtnPressed(self)
        currScore = 0
        currScoreLbl.text = String(currScore)
    }
    @IBAction func subOnlyBtnPressed(_ sender: Any) {
        operts = ["-"]
        skipBtnPressed(self)
        currScore = 0
        currScoreLbl.text = String(currScore)
    }
    @IBAction func multpOnlyBtnPressed(_ sender: Any) {
        operts = ["x"]
        skipBtnPressed(self)
        currScore = 0
        currScoreLbl.text = String(currScore)
    }
    @IBAction func divOnlyBtnPressed(_ sender: Any) {
        operts = ["/"]
        skipBtnPressed(self)
        currScore = 0
        currScoreLbl.text = String(currScore)
    }
    @IBAction func rndAnyBtnPressed(_ sender: Any) {
        operts = ["+", "-", "x", "/"]
        skipBtnPressed(self)
        currScore = 0
        currScoreLbl.text = String(currScore)
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

