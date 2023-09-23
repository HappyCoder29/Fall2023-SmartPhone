//
//  ViewController.swift
//  SegueExampleWithCode
//
//  Created by Drillmaps on 23/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
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
            guard let name = txtName.text else {return}
            secondVC.name = name
        }
    }
    
}

