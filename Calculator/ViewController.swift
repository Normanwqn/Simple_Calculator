//
//  ViewController.swift
//  Calculator
//
//  Created by Norman Qining Wen on 27/11/2019.
//  Copyright © 2019 Norman Qining Wen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var prevNum:Double = 0;
    var calculate = false; //whether an operator is pressed
    var whichOperation = 0; //determine which operator to be performed
    
    func format(input: Double) -> String {
        let truncated = Double(Int(input))
        if (input == truncated){
            let intval = Int(input);
            return String(intval);
        } else {
            return String(input);
        }
    }
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) { //Display
        if calculate == true{
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            calculate = false;
        } else {
            
            if (sender.tag == 17){
                label.text = label.text! + "."
            } else{
                label.text = label.text! + String(sender.tag-1)
            }
            numberOnScreen = Double(label.text!)!;
        }
        
    }
    @IBAction func buttons(_ sender: UIButton) {
        //Check if there is a number
        //and not a reset and equal
        if label.text != "" && sender.tag != 11 && sender.tag != 16{ //not C or =
            //Store the previoius number
            prevNum = Double(label.text!)!
            
            if sender.tag == 12{ //÷
                label.text = "÷";
            }
            if sender.tag == 13{ //*
                label.text = "×";
            }
            if sender.tag == 14{ //-
                label.text = "-";
            }
            if sender.tag == 15{ //+
                label.text = "+";
                
            }
            if sender.tag == 18{ //±
                label.text = String(numberOnScreen * -1);
                numberOnScreen *= -1
            }
            if sender.tag == 19{ //%
                label.text = String(numberOnScreen / 100);
                numberOnScreen /= 100
            }
            whichOperation = sender.tag
            calculate = true; //we are typing a new num
        }
        //If the equal sign is pressed
        else if sender.tag == 16{
            var ans : Double = 0;
            if whichOperation == 12{ //÷
                ans = prevNum / numberOnScreen;
            }
            else if whichOperation == 13{ //*
                ans = prevNum * numberOnScreen;
            }
            else if whichOperation == 14{ //-
                ans = prevNum - numberOnScreen;
                
            } else if whichOperation == 15{ //+
                ans = prevNum + numberOnScreen;
            } else if whichOperation == 18{
                
            }
            prevNum = ans;
            numberOnScreen = ans;
            label.text = format(input: ans);
            
        } else if sender.tag == 11{ //reset button
            label.text = ""
            prevNum = 0;
            numberOnScreen = 0;
            whichOperation = 0;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

