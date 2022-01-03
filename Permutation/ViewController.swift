//
//  ViewController.swift
//  PermutationW
//
//  Created by Matsui Keiji on 2016/01/18.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    var firstValue=0
    var secondValue=0
    @IBOutlet weak var UpperPicker:UIPickerView!
    @IBOutlet weak var LowerPicker:UIPickerView!
    @IBOutlet weak var UpperFirstValue:UILabel!
    @IBOutlet weak var UpperSecondValue:UILabel!
    @IBOutlet weak var LowerFirstValue:UILabel!
    @IBOutlet weak var LowerSecondValue:UILabel!
    @IBOutlet weak var PValue:UILabel!
    @IBOutlet weak var CValue:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   @objc func numberOfComponentsInPickerView(_ pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    @objc func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return 101
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        let c = "\(row)"
        return c
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag==0{
            firstValue=row
        }
        if pickerView.tag==1{
            secondValue=row
        }
        var fValue=0
        var sValue=0
        if secondValue > firstValue{
            fValue=secondValue
            sValue=firstValue
        }
        else{
            fValue=firstValue
            sValue=secondValue
        }
        UpperFirstValue.text="\(fValue)"
        LowerFirstValue.text="\(fValue)"
        UpperSecondValue.text="\(sValue)"
        LowerSecondValue.text="\(sValue)"
        var vBunshi=1.0
        var vBunbo=1.0
        if fValue >= fValue - sValue + 1{
            for i in fValue-sValue + 1 ... fValue{
                vBunshi=vBunshi * Double(i)
            }//for (var i=fValue; i >= fValue-sValue+1;i--)
        }
        
        if sValue >= 1{
            for i in 1...sValue{
                vBunbo = vBunbo * Double(i)
            }
        }
        let vCValue=vBunshi/vBunbo
        if log10(vCValue) > 20{
            CValue.text="\(vCValue)"
        }
        else{
            CValue.text=NSString(format: "%0.0f", vCValue) as String
        }
        if log10(vBunshi) > 20{
            PValue.text="\(vBunshi)"
        }
        else{
            PValue.text=NSString(format: "%0.0f", vBunshi) as String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
