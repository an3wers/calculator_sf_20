//
//  ViewController.swift
//  calculator_sf
//
//  Created by Artem on 20.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    var typing = false
    var firstNumber:Double = 0
    var secondNumber:Double = 0
    var operation:String = ""
    var dotIsYes = false
    var currentValue:Double {
        get {
            return Double(labelResult.text!)!
        }
        set {
            labelResult.text! = ("\(newValue)")
            typing = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // Кнопки с цифрами
    @IBAction func numberPressedBtn(_ sender: UIButton) {
        let number = sender.currentTitle!
        //print(number)
        if typing {
            labelResult.text = labelResult.text! + number
        } else {
            labelResult.text = number
            typing = true
        }
    }
    // Кнопки с вычислениями
    
    @IBAction func computationPressedBtn(_ sender: UIButton) {
        operation = sender.currentTitle!
        firstNumber = currentValue
        typing = false
        dotIsYes = false
        
    }
    
    //
    func operateWithNubres(operation: (Double, Double) -> Double) {
        currentValue = operation(firstNumber, secondNumber)
        typing = false
    }
    
    // Кнопка равно
    
    @IBAction func equalPressedBtn(_ sender: UIButton) {
        
        if typing {
            secondNumber = currentValue
        }
        
        dotIsYes = false
        
        switch operation {
        case "+":
            operateWithNubres {$0 + $1}
        case "-":
            operateWithNubres {$0 - $1}
        case "×":
            operateWithNubres {$0 * $1}
        case "÷":
            operateWithNubres {$0 / $1}
        default: break
        }
    }
    // Кнопка очищения
    
    @IBAction func clearPressedBtn(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        currentValue = 0
        labelResult.text = "0"
        typing = false
        operation = ""
        dotIsYes = false
    }
    // Кнопка плюс минус
    @IBAction func plusMinusPressedBtn(_ sender: UIButton) {
        currentValue = -currentValue
        
    }
    
    // Кнопка процент
    @IBAction func persentPressedBtn(_ sender: UIButton) {
        if firstNumber == 0 {
            currentValue = currentValue / 100
        } else {
            secondNumber = firstNumber * currentValue / 100
        }
        typing = false
    }
    
    // Кнопка возведения в квадрат
    @IBAction func squarePressedBtn(_ sender: UIButton) {
        currentValue = currentValue * currentValue
    }
    
    //Кнопка точка
    
    @IBAction func dotPressedBtn(_ sender: UIButton) {
        if typing && !dotIsYes {
            labelResult.text = labelResult.text! + "."
            dotIsYes = true
        }
        else if !typing && !dotIsYes {
            labelResult.text = "0."
        }
    }
}

