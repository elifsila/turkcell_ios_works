//
//  ViewController.swift
//  Homework-1
//
//  Created by Elif Sıla Okutucu on 6.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I can not enter the second number

    }
    
    @IBOutlet weak var txtData1:
        UITextField!
    
    @IBOutlet weak var txtData2:
        UITextField!
    
    @IBOutlet weak var summary: UILabel!
    
    
    
    @IBAction func fncDataPlus(_ sender: UIButton) {
        plusData()
    }
    func plusData (){
        let Data = FinalData()
        let sum1 = Data.predata1 + Data.predata2
        summary.text = "sum1: \(sum1)"
    }
    
    
    
    
    @IBAction func fncDataMinus(_ sender: UIButton) {
        minusData()

    }
    func minusData (){
        let Data = FinalData()
        let sum2 = Data.predata1 - Data.predata2
        summary.text = "sum2: \(sum2)"
    }
        
    
    
    
        
    @IBAction func fncDataMultiply(_ sender: UIButton) {
        multiplyData()
    }
    func multiplyData (){
        let Data = FinalData()
        let sum3 = Data.predata1 + Data.predata2
        summary.text = "sum3: \(sum3)"
    }
        
        
    
    
    
    @IBAction func fncDataDivide(_ sender: UIButton) {
        divideData()

    }
    func divideData (){
        let Data = FinalData()
        let sum4 = Data.predata1 + Data.predata2
        summary.text = "sum4: \(sum4)"
    }
    
    
    
    
    func FinalData() -> (predata1: Double, predata2: Double)
    {
        if let predata1 = Double(txtData1.text!), let predata2 = Double(txtData2.text!)
        {
            return(predata1,predata2)
            //print("Calculated Succesfuly!!")
            
        }
        else{
            print("Calculation Failed!!")
            return(0,0)
            
        }
    }

}

