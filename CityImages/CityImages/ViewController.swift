//
//  ViewController.swift
//  CityImages
//
//  Created by Drillmaps on 09/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "SpaceNeedle")
    }

    @IBAction func seattleImage(_ sender: Any) {
        imageView.image = UIImage(named: "SpaceNeedle")
    }
    
}

