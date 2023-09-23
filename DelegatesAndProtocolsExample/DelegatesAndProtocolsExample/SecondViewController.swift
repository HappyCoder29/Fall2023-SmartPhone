//
//  SecondViewController.swift
//  DelegatesAndProtocolsExample
//
//  Created by Drillmaps on 23/09/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    var sendNameDelegate: SendNameDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendNameToFirstVC(_ sender: Any) {
        guard let name = txtName.text else {return}
        
        sendNameDelegate?.sendName(name: name)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
