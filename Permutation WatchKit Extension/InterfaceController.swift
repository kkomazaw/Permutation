//
//  InterfaceController.swift
//  Permutation WatchKit Extension
//
//  Created by Matsui Keiji on 2016/01/18.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var firstValue=0
    var secondValue=0
    @IBOutlet weak var FirstPicker: WKInterfacePicker!
    @IBOutlet weak var SecondPicker: WKInterfacePicker!
    @IBOutlet weak var Pvalue: WKInterfaceLabel!
    @IBOutlet weak var Cvalue: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var pickerItems: [WKPickerItem] = []
        for i in 0...100 {
            let item = WKPickerItem()
            item.title = "\(i)"
            pickerItems.append(item)
        }
        self.FirstPicker.setItems(pickerItems)
        self.SecondPicker.setItems(pickerItems)
        // Configure interface objects here.
    }
    
    @IBAction func FirstPickerChanged(_ value: Int){
        var fValue=0
        var sValue=0
        firstValue = value
        if secondValue > firstValue{
            fValue = secondValue
            sValue = firstValue
        }
        else{
            fValue = firstValue
            sValue = secondValue
        }
        var vBunshi=1.0
        var vBunbo=1.0
        if fValue >= fValue - sValue + 1{
            for i in fValue-sValue+1 ... fValue{
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
            Cvalue.setText("\(fValue)C\(sValue)=\(vCValue)")
        }
        else{
            Cvalue.setText("\(fValue)C\(sValue)=" + (NSString(format: "%0.0f", vCValue) as String))
        }
        if log10(vBunshi) > 20{
            Pvalue.setText("\(fValue)P\(sValue)=\(vBunshi)")
        }
        else{
            Pvalue.setText("\(fValue)P\(sValue)=" + (NSString(format: "%0.0f", vBunshi) as String) as String)
        }
    }
    
    @IBAction func SecondPickerChanged(_ value: Int){
        var fValue=0
        var sValue=0
        secondValue = value
        if secondValue > firstValue{
            fValue = secondValue
            sValue = firstValue
        }
        else{
            fValue = firstValue
            sValue = secondValue
        }
        var vBunshi=1.0
        var vBunbo=1.0
        if fValue >= fValue - sValue + 1{
            for i in fValue-sValue+1 ... fValue{
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
            Cvalue.setText("\(fValue)C\(sValue)=\(vCValue)")
        }
        else{
            Cvalue.setText("\(fValue)C\(sValue)=" + (NSString(format: "%0.0f", vCValue) as String))
        }
        if log10(vBunshi) > 20{
            Pvalue.setText("\(fValue)P\(sValue)=\(vBunshi)")
        }
        else{
            Pvalue.setText("\(fValue)P\(sValue)=" + (NSString(format: "%0.0f", vBunshi) as String))
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
