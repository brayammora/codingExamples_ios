//
//  FirstViewController.swift
//  03-codingExamples
//
//  Created by Brayam Alberto Mora Arias on 25/02/20.
//  Copyright © 2020 Brayam Alberto Mora Arias. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelAge: UILabel!
    
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge = -1
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateAgeLabel()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let theText = textField.text {
            self.userName = theText
        }
        return true
    }
    
    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        self.updateAgeLabel()
    }
    
    func updateAgeLabel(){
        self.userAge = Int(self.sliderAge.value)
        self.labelAge.text = "\(self.userAge)"
    }
    
    @IBAction func validateData(_ sender: UIButton) {
        
        let shouldEnterTheParty = (userName == "Brayam" || userAge >= 18)
        
        if shouldEnterTheParty {
            print("Bienvenido a la fiesta")
            self.view.backgroundColor = UIColor(displayP3Red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        }else{
            print("No puedes pasar.")
            self.view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.7)
        }
    }
}

