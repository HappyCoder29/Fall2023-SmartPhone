//
//  ViewController.swift
//  TableViewControllerExample
//
//  Created by Drillmaps on 23/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let names = ["Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark","Ashish", "Tom", "Bill", "Mark"]
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tblView.delegate = self
//        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
    
        return cell;
    }


}

