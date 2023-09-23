//
//  ViewController.swift
//  HelloWorld
//
//  Created by Drillmaps on 09/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHelloWorld: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ashish")
    }

    @IBAction func changeLabelNameAction(_ sender: Any) {
        lblHelloWorld.text = "Hello Seattle"
    }
    
}

