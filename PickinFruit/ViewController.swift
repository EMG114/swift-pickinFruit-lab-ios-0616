//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   // @IBOutlet weak var fruitPicker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var fruitPicker: UIPickerView!
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
        
        
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
         return 3
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return 1000
    }
    
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row % fruitsArray.count]
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 0, animated: true)
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 1, animated: true)
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 2, animated: true)
        
       if self.fruitPicker.selectedRowInComponent(0) == self.fruitPicker.selectedRowInComponent(1) && self.fruitPicker.selectedRowInComponent(1) == self.fruitPicker.selectedRowInComponent(2) {
        resultLabel.text = "WINNER!"
        } else {
        resultLabel.text = "TRY AGAIN"}
        
        resultLabel.alpha = 0
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: UIViewAnimationOptions.Repeat, animations: {
            UIView.setAnimationRepeatCount(3)
            self.resultLabel.alpha = 1
            
        }) { (true) in
            self.resultLabel.alpha = 0
        }
            
   }
   

}




// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



