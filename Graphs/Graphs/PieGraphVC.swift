//
//  PieGraphVC.swift
//  Graphs
//
//  Created by Phani on 4/27/16.
//  Copyright © 2016 Phani. All rights reserved.
//

import UIKit
import Charts
class PieGraphVC: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        pieChartView.delegate = self
        pieChartView.drawHoleEnabled = false
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
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Units Sold")
        pieChartDataSet.sliceSpace = 2
        pieChartDataSet.selectionShift = 5
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        //pieChartData.highlightEnabled = false
        //pieChartData.
    
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        pieChartView.data = pieChartData
//        pieChartView.usePercentValuesEnabled = true
//        pieChartView.drawSliceTextEnabled = true
//        pieChartView.drawSlicesUnderHoleEnabled = true
//        pieChartView.drawHoleEnabled = true
        pieChartView.animate(xAxisDuration: 4, easingOption: ChartEasingOption.EaseInBounce)

        

    }

    @IBAction func CloseButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
extension PieGraphVC:ChartViewDelegate{
     func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight){
        print("chartValueSelected")
    }
    
    // Called when nothing has been selected or an "un-select" has been made.
     func chartValueNothingSelected(chartView: ChartViewBase){
        print("chartValueNothingSelected")
    }
    
   
  
}