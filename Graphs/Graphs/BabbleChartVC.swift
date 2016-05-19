//
//  babbleChartVC.swift
//  Graphs
//
//  Created by Phani on 18/05/16.
//  Copyright © 2016 Phani. All rights reserved.
//

import UIKit
import Charts

class BabbleChartVC: UIViewController {

    @IBOutlet weak var bubbleChartView: BubbleChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 0.15, 6.0, 0.25, 12.0, 16.0]

        // barView.delegate = self
        setChart(months, values: unitsSold)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setChart(dataPoints: [String], values: [Double]) {
        
        
        
        var dataEntries: [BubbleChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
        let dataEntry = BubbleChartDataEntry(xIndex: i,value: values[i],size: CGFloat(values[i]))
            dataEntries.append(dataEntry)
        }
                    
        
        
        let barChartDataSet = BubbleChartDataSet(yVals: dataEntries, label: "Units Sold")
        let barChartData = BubbleChartData(xVals: dataPoints, dataSet: barChartDataSet)
        
        
        bubbleChartView.xAxis.labelPosition = .Bottom
        bubbleChartView.xAxis.labelRotationAngle = 45
        bubbleChartView.xAxis.drawGridLinesEnabled = false
        bubbleChartView.xAxis.drawAxisLineEnabled = false
        
        
        bubbleChartView.xAxis.axisMaxValue = 300
        bubbleChartView.leftAxis.drawGridLinesEnabled = false
        bubbleChartView.xAxis.spaceBetweenLabels = 10
        bubbleChartView.scaleXEnabled = true
        bubbleChartView.scaleYEnabled = false
        
        
        bubbleChartView.leftAxis.zeroLineColor = UIColor.blueColor()
        bubbleChartView.leftAxis.zeroLineWidth = 2
        bubbleChartView.rightAxis.enabled = false
        bubbleChartView.leftAxis.labelPosition = .OutsideChart
        bubbleChartView.xAxis.avoidFirstLastClippingEnabled = false
        
        bubbleChartView.animate(xAxisDuration: 4, easingOption: .EaseOutBounce)
        
        bubbleChartView.data = barChartData
        
    }

    @IBAction func CloseButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
