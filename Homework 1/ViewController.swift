//
//  ViewController.swift
//  Homework 1
//
//  Created by Omar Perez on 9/18/17.
//  Copyright © 2017 Omar Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //: Outlets
    @IBOutlet weak var runningTimeText: UITextField!
    @IBOutlet weak var runningCalText: UITextField!
    @IBOutlet weak var strExTimeText: UITextField!
    @IBOutlet weak var strExCalText: UITextField!
    @IBOutlet weak var foodIntakeText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var bloodPressureText: UITextField!
    @IBOutlet weak var dayAddedLabel: UILabel!
    
    //: Additional variables
    var healthData = HealthData()
    
    //: Array of HealthData type to store the weekly data
    var weeklyHealthData = [HealthData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dayAddedLabel.isHidden = true
        runningTimeText.text = "0"
        runningCalText.text = "0"
        strExTimeText.text = "0"
        strExCalText.text = "0"
        foodIntakeText.text = "0"
        weightText.text = "0"
        bloodPressureText.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //: Clicking the submit button
    @IBAction func submitButton(_ sender: UIButton) {
        if CheckTextFields() == true{
            
            //: Storing info from text fields
            healthData.runningTime = Int(runningTimeText.text!)!
            healthData.runningCalories = Int(runningCalText.text!)!
            healthData.strExTime = Int(strExTimeText.text!)!
            healthData.strExCalories = Int(strExCalText.text!)!
            healthData.foodIntakeCalories = Int(foodIntakeText.text!)!
            healthData.weight = Int(weightText.text!)!
            healthData.bloodPressure = Int(bloodPressureText.text!)!
            if weeklyHealthData.count < 7 {
                weeklyHealthData.append(healthData)
            }
            else {
                weeklyHealthData.removeFirst()
                weeklyHealthData.append(healthData)
            }
            dayAddedLabel.text = "Day \(weeklyHealthData.count) has been added."
            dayAddedLabel.isHidden = false;
            
        }
    }
    
    //: Checks that all Text Fields are not empty
    func CheckTextFields() ->Bool{
        var result:Bool = false
        
        if runningTimeText.text != "" && runningCalText.text != "" && strExTimeText.text != "" && strExCalText.text != "" && foodIntakeText.text != "" && weightText.text != "" && bloodPressureText.text != "" {
            result = true
        }
        return result
    }
    
    //: A method to help with the math required to display the Weekly Health Report
    //: cases being:
    //: 1) Total Calorie Intake
    //: 2) Total Calories Burned
    //: 3) Average Blood Pressure
    //: 4) Weight Change
    
    func addEmUp(choice:Int) ->Int {
        
        var result = 0
        
        switch choice {
        case 1:
            for day in weeklyHealthData {
                result = result + day.foodIntakeCalories
            }
            return result
        case 2:
            for day in weeklyHealthData {
                result = result + day.runningCalories + day.strExCalories
            }
            return result
        case 3:
            if weeklyHealthData.isEmpty == false {
                for day in weeklyHealthData {
                    result = result + day.bloodPressure
                }
                result = result / weeklyHealthData.count
            }
            return result
        case 4:
            if weeklyHealthData.isEmpty == false {
                result = weeklyHealthData[6].weight - weeklyHealthData[0].weight
            }
            return result
        default:
            return -1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destViewController: SummaryViewController = segue.destination as! SummaryViewControllers
        
        destViewController.totalCalorieIntake = addEmUp(choice: 1)
        destViewController.totalCaloriesBurned = addEmUp(choice: 2)
        destViewController.avgBloodPressure = addEmUp(choice: 3)
        destViewController.weightChange = addEmUp(choice: 4)
    }
    
    @IBAction func toDataInput(_ segue: UIStoryboardSegue) {
    }
}

