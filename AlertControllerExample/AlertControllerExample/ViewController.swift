//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Drillmaps on 30/09/23.
//

import UIKit

class ViewController: UIViewController {

    var txtField: UITextField?
    @IBOutlet weak var lblAlert: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Sample Alert Controller", message: "Simple Message", preferredStyle: .alert)
        let okButton =  UIAlertAction(title: "OK", style: .default){ action in
            self.lblAlert.text = self.txtField?.text
            print("OK Button Pressed")
        }
        let cancelButton =  UIAlertAction(title: "Cancel", style: .cancel){ action in
            print("Cancel Button Pressed")
        }
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        alertController.addTextField { txtField in
            txtField.placeholder = "Type something here"
            self.txtField = txtField
        }
        
        self.present(alertController, animated: true)

        
        
    }
    
}

