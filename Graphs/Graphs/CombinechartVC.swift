
//
//  CombinechartVC.swift
//  Graphs
//
//  Created by Phani on 02/09/16.
//  Copyright © 2016 Phani. All rights reserved.
//


import UIKit
import Charts

class CombinechartVC: UIViewController {
    
    
    @IBOutlet weak var combineChartView: CombinedChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 0.15, 6.0, 0.25, 12.0, 16.0]
        // combineChartView.delegate = self
        prepareChartView()
        setChart(months, yValuesLineChart: unitsSold, yValuesBarChart: unitsSold)
       // setChart(months, values: unitsSold)
    }
    func prepareChartView()  {
        combineChartView.xAxis.labelPosition = .Bottom
        combineChartView.xAxis.labelTextColor = UIColor.blueColor()
        
        combineChartView.xAxis.drawGridLinesEnabled = false
        combineChartView.xAxis.drawAxisLineEnabled = false
        combineChartView.xAxis.spaceBetweenLabels = 0
        combineChartView.xAxis.spaceBetweenLabels = 0
        combineChartView.xAxis.avoidFirstLastClippingEnabled = false
        
        combineChartView.leftAxis.drawGridLinesEnabled = true
        combineChartView.leftAxis.zeroLineColor = UIColor.blueColor()
        combineChartView.leftAxis.gridColor = UIColor.yellowColor()
        combineChartView.leftAxis.zeroLineWidth = 2
        combineChartView.rightAxis.enabled = false
        combineChartView.leftAxis.labelPosition = .OutsideChart
        combineChartView.leftAxis.labelTextColor = UIColor.redColor()
        //combineChartView.leftAxis.labelFont = UIFont.latoRegularFontOfSize(14)
        combineChartView.setScaleEnabled(false)
        combineChartView.animate(xAxisDuration: 4, easingOption: .EaseInOutSine)
        
    }
    
    func setChart(xValues: [String], yValuesLineChart: [Double], yValuesBarChart: [Double]) {
        combineChartView.noDataText = "Please provide data for the chart."
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        var yVals2 : [BarChartDataEntry] = [BarChartDataEntry]()
        
        for i in 0..<xValues.count {
            
            yVals1.append(ChartDataEntry(value: yValuesLineChart[i], xIndex: i))
            yVals2.append(BarChartDataEntry(values:[4,10], xIndex: i))
            
        }
        
        let lineChartSet = LineChartDataSet(yVals: yVals1, label: "Line Data")
        let barChartSet: BarChartDataSet = BarChartDataSet(yVals: yVals2, label: "Bar Data")
        barChartSet.barSpace = 0
        barChartSet.colors = [UIColor.clearColor(), UIColor.blueColor().colorWithAlphaComponent(0.5)]
        barChartSet.barShadowColor = UIColor.clearColor()
        barChartSet.highlightAlpha = 0

        
        
        let data: CombinedChartData = CombinedChartData(xVals: xValues)
    
        data.lineData = LineChartData(xVals: xValues, dataSets: [lineChartSet])
        let bardata = BarChartData(xVals: xValues, dataSets: [barChartSet])
        bardata.setDrawValues(false)
        
        data.barData = bardata

        combineChartView.data = data
        
    }

//    func setChart(dataPoints: [String], values: [Double]) {
//        
//        
//        
//        var dataEntries: [BarChartDataEntry] = []
//        
//        let dataEntry = BarChartDataEntry(values:[0,values[0]], xIndex: 0)
//        dataEntries.append(dataEntry)
//        
//        for i in 1..<dataPoints.count {
//            let dataEntry = BarChartDataEntry(values:[values[i-1],values[i]], xIndex: i)
//            dataEntries.append(dataEntry)
//        }
//        
//        
//        
//        let barChartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
//        let barChartData = BarChartData(xVals: dataPoints, dataSet: barChartDataSet)
//        barChartDataSet.colors = [ UIColor.clearColor(), UIColor.grayColor()]
//        
//        combineChartView.xAxis.labelPosition = .Bottom
//        combineChartView.xAxis.labelRotationAngle = 45
//        combineChartView.xAxis.drawGridLinesEnabled = false
//        combineChartView.xAxis.drawAxisLineEnabled = false
//        combineChartView.drawValueAboveBarEnabled = true
//        
//        combineChartView.xAxis.axisMaxValue = 300
//        combineChartView.leftAxis.drawGridLinesEnabled = false
//        combineChartView.xAxis.spaceBetweenLabels = 10
//        combineChartView.scaleXEnabled = true
//        combineChartView.scaleYEnabled = false
//        
//        
//        combineChartView.leftAxis.zeroLineColor = UIColor.blueColor()
//        combineChartView.leftAxis.zeroLineWidth = 2
//        combineChartView.rightAxis.enabled = false
//        combineChartView.leftAxis.labelPosition = .OutsideChart
//        combineChartView.xAxis.avoidFirstLastClippingEnabled = false
//        
//        combineChartView.animate(xAxisDuration: 4, easingOption: .EaseOutBounce)
//        
//        combineChartView.barData =  barChartData
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CloseButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
