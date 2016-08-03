//
//  ViewController.swift
//  FlowerColorTable
//
//  Copyright (c) 2015 Koby Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let kSectionCount:Int = 2
    let kManufactureSection: Int = 0
    let kvegetablesSection: Int = 1
    
    let fruit: [String] = ["Apple","Banana","Orange"]
    let vegetables: [String] = ["Broccoli","Cauliflower","Brussel sprouts","Carrot","Green bean"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("flowerCell")! as UITableViewCell
        switch (indexPath.section) {
            case kManufactureSection:
                cell.textLabel!.text=fruit[indexPath.row]
            case kvegetablesSection:
                cell.textLabel!.text=vegetables[indexPath.row]
            default:
                cell.textLabel!.text="Unknown"
        }
		
        let manOSImage: UIImage=UIImage(named: cell.textLabel!.text!)!
        cell.imageView!.image=manOSImage
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return kSectionCount
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case kManufactureSection:
                return "fruit"
            case kvegetablesSection:
                return "vegetables"
            default:
                return "Unknown"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case kManufactureSection:
                return fruit.count
            case kvegetablesSection:
                return vegetables.count
            default:
                return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var message: String
        switch indexPath.section {
            case kManufactureSection:
                message = "You chose \(fruit[indexPath.row])"
            case kvegetablesSection:
                message = "You chose \(vegetables[indexPath.row])"
            default:
                message = "What did you choose?!!?"
        }
        
        let alertController = UIAlertController(title: "Item Selected",
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction = UIAlertAction(title: "Ok",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

