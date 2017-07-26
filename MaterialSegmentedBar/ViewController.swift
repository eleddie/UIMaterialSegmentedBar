//
//  ViewController.swift
//  MaterialSegmentedBar
//
//  Created by Eduardo Sanchez on 7/26/17.
//  Copyright © 2017 Eduardo Sanchez. All rights reserved.
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

    @IBAction func segmentedBarChange(_ sender: MaterialSegmentedBar) {
        print(sender.selectedSegmentIndex)
    }

}

