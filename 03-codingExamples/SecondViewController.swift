//
//  SecondViewController.swift
//  03-codingExamples
//
//  Created by Brayam Alberto Mora Arias on 25/02/20.
//  Copyright © 2020 Brayam Alberto Mora Arias. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var textViewResult: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelGoldNum: UILabel!
    
    
    var fibonacci: [Int] = [0,1]
    var fibId = 1
    var wantsGoldNum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabel(Int(self.stepper.value))
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        updateLabel(Int(sender.value))
    }
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        self.wantsGoldNum = sender.isOn
        calculateGoldNum()
    }
    
    func generateFibonacciNumbers(){
        /*if (fibId <= 1 || fibId > 100) {
            return
        }
        */
        fibonacci = [0,1]
        for i in 2...fibId {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
        let fibStr: [String] = fibonacci.compactMap({ String($0) })
        
        let result: String = fibStr.joined(separator: "\n")
        
        self.textViewResult.text = result
    }
    
    func updateLabel(_ id: Int){
        self.fibId = id
        self.labelNumber.text = "\(self.fibId)"
        generateFibonacciNumbers()
        calculateGoldNum()
    }
    
    func calculateGoldNum(){
        if(self.wantsGoldNum) {
            let last = Double(fibonacci[fibonacci.count - 1])
            let previous = Double(fibonacci[fibonacci.count - 2])
            let goldNum = last / previous
            self.labelGoldNum.text = "\(goldNum)"
        }else {
            self.labelGoldNum.text = "Ver el número de oro"
        }
    }
}

