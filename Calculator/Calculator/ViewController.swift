//
//  ViewController.swift
//  Calculator
//
//  Created by ken honda on 2017/07/04.
//  Copyright © 2017年 ken honda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var prev = ""
    var calc = ""
    var start = 1
    var after_calc = 0
    var after_equal = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func num_button_pushed(_ sender: UIButton) {
        if after_calc == 1 || after_equal == 1 || start == 1{
        label.text = ""
        }
        label.text! += sender.titleLabel!.text!
        after_calc = 0
        after_equal = 0
        start = 0
    }
    @IBAction func dot_pushed(_ sender: UIButton) {
        if after_calc != 0 || after_equal != 0 {
            label.text = "0"
        }
        if !(label.text?.contains("."))!{
        label.text! += sender.titleLabel!.text!
        after_calc = 0
        after_equal = 0
        start = 0
        }
    }
    @IBAction func calc_sign_pushed(_ sender: UIButton) {
        calc = sender.titleLabel!.text!
        prev = label.text!
        label.text = ""
        label.text! += sender.titleLabel!.text!
        after_calc = 1
    }
    @IBAction func equal_pushed(_ sender: Any) {
        var param_2 = Double(label.text!)
        var param_1 = Double(prev)
        if prev != "" && calc != "" && start != 1 {
            if calc == "+"{
            label.text = String(param_1! + param_2!)}else if calc == "-"{
            label.text = String(param_1! - param_2!)}else if calc == "*"{
            label.text = String(param_1! * param_2!)}else if calc == "/"{
            label.text = String(param_1! / param_2!)
            }
            calc = ""
            prev = ""
            after_equal = 1
            }
        }
    
    @IBAction func reset_Button(_ sender: UIButton) {
        label.text = "0"
        start = 1
        prev = ""
        calc = ""
    }
    }

