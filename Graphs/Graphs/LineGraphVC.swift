//
//  LineGraphVC.swift
//  Graphs
//
//  Created by Phani on 4/27/16.
//  Copyright © 2016 Phani. All rights reserved.
//

import UIKit
import Charts
class LineGraphVC: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 30.0, 12.0, 16.0]
        
        setChart(months, values: unitsSold)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        

        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartDataSet.drawCirclesEnabled = false
        lineChartDataSet.drawCubicEnabled = true
        let colors  = [UIColor.blueColor().CGColor,UIColor.blackColor().CGColor]
        let gradient : CGGradientRef = CGGradientCreateWithColors(nil, colors, nil)!

        lineChartDataSet.fill = ChartFill.fillWithLinearGradient(gradient, angle: 180)
        lineChartDataSet.fillAlpha = 1.0
        lineChartDataSet.drawFilledEnabled = true
        lineChartDataSet.lineWidth = 2.0
    
       // lineChartDataSet.fillFormatter = ChartFillFormatter()
        
        lineChartView.xAxis.labelPosition = .Bottom
        lineChartView.xAxis.labelRotationAngle = 45
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.spaceBetweenLabels = 10
        lineChartView.scaleXEnabled = true
        lineChartView.scaleYEnabled = false
        
        
        lineChartView.leftAxis.zeroLineColor = UIColor.blueColor()
        lineChartView.leftAxis.zeroLineWidth = 2
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.labelPosition = .OutsideChart
        
        
        lineChartView.data = lineChartData
        lineChartView.animate(xAxisDuration: 4, easingOption: .Linear)

        
    }

    @IBAction func CloseButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
