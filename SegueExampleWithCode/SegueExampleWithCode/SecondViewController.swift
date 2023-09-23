//
//  SecondViewController.swift
//  SegueExampleWithCode
//
//  Created by Drillmaps on 23/09/23.
//

import UIKit

class SecondViewController: UIViewController {

    var name = ""
    @IBOutlet weak var txtWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtWelcome.text = "Welcome \(name)"

    }
    
}
