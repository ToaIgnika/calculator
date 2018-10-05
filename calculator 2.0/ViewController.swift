//
//  ViewController.swift
//  calculator 2.0
//
//  Created by toaignika on 2018-10-04.
//  Copyright © 2018 toaignika. All rights reserved.
//

import UIKit
import AVFoundation

var resultArray = [AnyObject]()
//var resultArray: Array = []
var rNumber: NSString = ""
var lNumber: NSString = ""
var op: String = ""
var result: Double = 0.0

class ArithmeticOperation {
    let rNum: Double
    let lNum: Double
    
    init(rNum: Double, lNum: Double) {
        self.rNum = rNum
        self.lNum = lNum
    }
    func addition() -> Double {
        result = rNum + lNum
        return result
    }
    func subtraction() -> Double {
        result = rNum - lNum
        return result
    }
    func multiplication() -> Double {
        result = rNum * lNum
        return result
    }
    func division() -> Double {
        if lNum.isZero == false {
            return rNum/lNum
        } else {
            return 0.0
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var hiddenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numbers(_ sender: UIButton) {
        var digit = sender.titleLabel?.text
        if answerLabel.text == "" || answerLabel.text == "0.0" || answerLabel.text == "0.00"
        {
            answerLabel.text = digit
        } else {
            answerLabel.text = answerLabel.text! + digit!
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        if hiddenLabel.text == "" {
            rNumber = answerLabel.text! as NSString
            hiddenLabel.text = sender.titleLabel?.text
            op = hiddenLabel.text!
            answerLabel.text = "0.0"
            print("Operation Tapped: \(resultArray)")
        } else {
            answerLabel.text = "0.0"
            eqls(nil)
            print("Equal Tapped: \(resultArray)")
            
        }
    }
    
    @IBAction func eqls(_ sender: AnyObject?) {
        var rightNum: Double
        var leftNum: Double
        var lNumber: NSString = ""
        
        rightNum = rNumber.doubleValue
        lNumber = answerLabel.text! as NSString //Necessary to convert to Double
        leftNum = lNumber.doubleValue
        
        var answer = ArithmeticOperation(rNum: rightNum, lNum: leftNum)
        var string: Double = 0.0
        if op == "+" {
            string = answer.addition()
            answerLabel.text = String(format:"%.02f", string)
            hiddenLabel.text = ""
        } else if op == "-" {
            string = answer.subtraction()
            answerLabel.text = String(format:"%.02f", string)
            hiddenLabel.text = ""
        } else if op == "*" {
            string = answer.multiplication()
            answerLabel.text = String(format:"%.02f", string)
            hiddenLabel.text = ""
        } else if op == "/" {
            string = answer.division()
            answerLabel.text = String(format:"%.02f", string)
            hiddenLabel.text = ""
        }else {
            answerLabel.text = "Operation Error!"
        }
        let utterance = AVSpeechUtterance(string: String(format:"%.02f", string))
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)

    }
    @IBAction func allClear(_ sender: UIButton) {
        answerLabel.text = "0.0"
        hiddenLabel.text = ""
        resultArray.removeAll()
    }
    @IBAction func screenClear(_ sender: UIButton) {
        answerLabel.text = "0.0"
    }
}


