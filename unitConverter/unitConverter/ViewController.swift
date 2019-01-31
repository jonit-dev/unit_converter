//
//  ViewController.swift
//  unitConverter
//
//  Created by Joao Paulo Furtado Silva on 1/21/19.
//  Copyright © 2019 Joao Paulo Furtado Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperaturePicker: UIPickerView!

    
    private let temperatureValues = (-100...100).map { $0 }
    let unitConverter = UnitConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        temperaturePicker.dataSource = self;
        temperaturePicker.delegate = self;
        //temperaturePicker.reloadAllComponents()
        
        
        //setup picker values
     
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
       
        
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       //access to instance of pickerview
        return 1
    }
    
    //set quantity of items on picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //rows in component
        return temperatureValues.count
    }
    
    //tells delegate what to return
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //get picker labels. rows comes from titleForRow
        return "\(temperatureValues[row])°C"
    }
    
    //event: user tapped row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       let celciusValue = temperatureValues[row]
        temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: celciusValue))"
        
        
    }
  
}
