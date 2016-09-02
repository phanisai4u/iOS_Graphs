//
//  ViewController.swift
//  Graphs
//
//  Created by Phani on 4/27/16.
//  Copyright © 2016 Phani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chartTypeTableView: UITableView!
    var chartNames = ["LineGraph","PieGraph","DonutGraph","BarGraph","BubblecGraph","CandelStickGraph","CombineGraph"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController : UITableViewDataSource{
    
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartNames.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = chartNames[indexPath.row]
             return cell
    }
    
}
extension ViewController : UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var vc :UIViewController
        if indexPath.row == 0 {
             vc = self.storyboard?.instantiateViewControllerWithIdentifier("LineGraphVC_ID") as! LineGraphVC
        }else if indexPath.row == 1 {
             vc = self.storyboard?.instantiateViewControllerWithIdentifier("PieGraphVC_ID") as! PieGraphVC
        }else  if indexPath.row == 2{
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("DonutVC_ID") as! DonutVC
        }else if indexPath.row == 3{
             vc = self.storyboard?.instantiateViewControllerWithIdentifier("BarchartVC_ID") as! BarchartVC
        } else if indexPath.row == 4{
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("BabbleChartVC_ID") as! BabbleChartVC
        }else if indexPath.row == 6{
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("CombinechartVC_ID") as! CombinechartVC
        }else {
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("WaterFallChartVC_ID") as! WaterFallChartVC
        }
        presentViewController(vc, animated: true, completion: nil)
    }
  
}