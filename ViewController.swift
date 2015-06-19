//
//  ViewController.swift
//  ServoController
//
//  Created by Sehlstedt on 17/05/2015.
//  Copyright (c) 2015 Kings Hill Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func servoSlider(sender: UISlider) {
        // Get sliders current value
        var currentValue = Float(sender.value)
        
        // Format http string with current value
        var requestString = String(format: "https://agent.electricimp.com/{your agent url}?setServo=%.02f", currentValue)
        
        // Log values
        println(requestString)
        println(currentValue)
        
        // Set NSURL and NSURLRequest
        let url = NSURL(string: requestString)
        let request = NSURLRequest(URL: url!)
        
        // Run asynchronus request with relevant values
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response, data, error) in println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
    }
}

