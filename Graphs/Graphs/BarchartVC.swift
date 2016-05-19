//
//  BarchartVC.swift
//  Graphs
//
//  Created by Phani on 18/05/16.
//  Copyright © 2016 Phani. All rights reserved.
//

import UIKit
import Charts

class BarchartVC: UIViewController {
    
    @IBOutlet weak var barView: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 0.15, 6.0, 0.25, 12.0, 16.0]
       // barView.delegate = self
        setChart(months, values: unitsSold)
    }
    func setChart(dataPoints: [String], values: [Double]) {
        
    
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        
        
        let barChartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let barChartData = BarChartData(xVals: dataPoints, dataSet: barChartDataSet)
        
       
        barView.xAxis.labelPosition = .Bottom
        barView.xAxis.labelRotationAngle = 45
        barView.xAxis.drawGridLinesEnabled = false
        barView.xAxis.drawAxisLineEnabled = false
     
        
        barView.xAxis.axisMaxValue = 300
        barView.leftAxis.drawGridLinesEnabled = false
        barView.xAxis.spaceBetweenLabels = 10
        barView.scaleXEnabled = true
        barView.scaleYEnabled = false
        
        
        barView.leftAxis.zeroLineColor = UIColor.blueColor()
        barView.leftAxis.zeroLineWidth = 2
        barView.rightAxis.enabled = false
        barView.leftAxis.labelPosition = .OutsideChart
        barView.xAxis.avoidFirstLastClippingEnabled = false
        
        barView.animate(xAxisDuration: 4, easingOption: .EaseOutBounce)

        barView.data = barChartData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CloseButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
  
}
