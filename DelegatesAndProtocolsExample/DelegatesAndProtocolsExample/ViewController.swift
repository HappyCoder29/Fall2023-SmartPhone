//
//  ViewController.swift
//  DelegatesAndProtocolsExample
//
//  Created by Drillmaps on 23/09/23.
//

import UIKit

class ViewController: UIViewController, SendNameDelegate {
    /*
     1. Create a file with name delegate which will have the protocol function
     2. in the second VC add an optional instance of the protocol function
     3. In the first VC conform to the protocol declared in step1
     4. Add the function stub in the first VC
     5. In the prepare for segue function of the first VC, add self as the delegate so that whenever
        secind VC calls the function we will handle it
     6. When the second VC raises the delgate function the fust VC will receive it 
     **/
    

    @IBOutlet weak var lblFirstVC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotoSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueSecondVC"){
            let secondVC = segue.destination as! SecondViewController
            secondVC.sendNameDelegate = self
        }
    }
    
    func sendName(name: String) {
        print("Name = \(name)")
        lblFirstVC .text = "Value sent from the Second VC  = \(name)"
    }
    
}

