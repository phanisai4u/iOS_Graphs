//
//  WaterFallChartVC.swift
//  Graphs
//
//  Created by Phani on 20/06/16.
//  Copyright © 2016 Phani. All rights reserved.
//

import UIKit
import Charts

class WaterFallChartVC: UIViewController {

    @IBOutlet weak var chartView: CandleStickChartView!
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
        
        
        
        var dataEntries: [CandleChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            
            
            let mult = Double(dataPoints.count + 1)
            let val =  Double(arc4random_uniform(40)) + mult
            let high =  Double(arc4random_uniform(9)) + 8.0
            let low = Double(arc4random_uniform(9)) + 8.0
            let open = Double(arc4random_uniform(6)) + 1.0
            let close = Double(arc4random_uniform(6)) + 1.0
            //let  even = (i % 2 == 0) ? true :false
            
//            [CandleChartDataEntry alloc] initWithXIndex:i shadowH:val + high shadowL:val - low open:even ? val + open : val - open close:even ? val - close : val + close]
            
            let dataEntry = CandleChartDataEntry(xIndex: i, shadowH:val + high, shadowL: val - low, open: val + open, close: val + close) // CandleChartDataEntry(xIndex: i,value: values[i],size: CGFloat(values[i]))
            dataEntries.append(dataEntry)
        }
        
        
        
        let chartDataSet = CandleChartDataSet(yVals: dataEntries, label: "Units Sold")
        chartDataSet.axisDependency = .Left
        
        
        let chartData = CandleChartData(xVals: dataPoints, dataSet: chartDataSet)
        
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.labelRotationAngle = 45
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        
        
        chartView.xAxis.axisMaxValue = 300
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.xAxis.spaceBetweenLabels = 10
        chartView.scaleXEnabled = true
        chartView.scaleYEnabled = false
        
        
        chartView.leftAxis.zeroLineColor = UIColor.blueColor()
        chartView.leftAxis.zeroLineWidth = 2
        chartView.rightAxis.enabled = false
        chartView.leftAxis.labelPosition = .OutsideChart
        chartView.xAxis.avoidFirstLastClippingEnabled = false
        
        chartView.animate(xAxisDuration: 4, easingOption: .EaseOutBounce)
        
        chartView.data = chartData
        
    }

    
    @IBAction func closebuttonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
 
    }


}
