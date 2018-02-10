//
//  SummaryViewController.swift
//  Homework 1
//
//  Created by Omar Perez on 9/26/17.
//  Copyright © 2017 Omar Perez. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    //: Outlets
    @IBOutlet weak var totalCalorieIntakeText: UITextField!
    @IBOutlet weak var totalCalories: UITextField!
    @IBOutlet weak var avgBloodPressureText: UITextField!
    @IBOutlet weak var weightChangeText: UITextField!
    
    //: Additional Variables
    var totalCalorieIntake:Int = 0
    var totalCaloriesBurned:Int = 0
    var avgBloodPressure:Int = 0
    var weightChange:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalCalorieIntakeText.text = String(totalCalorieIntake)
        totalCalories.text = String(totalCaloriesBurned)
        avgBloodPressureText.text = String(avgBloodPressure)
        weightChangeText.text = String(weightChange)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
