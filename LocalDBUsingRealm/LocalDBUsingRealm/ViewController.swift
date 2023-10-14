//
//  ViewController.swift
//  LocalDBUsingRealm
//
//  Created by Drillmaps on 14/10/23.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var txtSymbol: UITextField!
    lazy var db = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func getStockValues(_ sender: Any) {
        do{
            guard let symbol = txtSymbol.text else {return }
            //let stocks = db.objects(StockClass.self)
            let stock = db.object(ofType: StockClass.self, forPrimaryKey: symbol)
            print(stock)
            
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func getStockAction(_ sender: Any) {
        guard let stockSymbol = txtSymbol.text else {return}
        
        let url = "\(baseURL)profile/\(stockSymbol)?apikey=\(apiKey)"
        print(url)
        
        AF.request(url).responseJSON { response in
            if(response.error != nil){
                print(response.error?.localizedDescription)
                return
            }
            // We have valid data here
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
            
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].floatValue
            let companyName = stock["companyName"].stringValue
            let description = stock["description"].stringValue
            
            print(symbol)
            print(price)
            print(companyName)
            print(description)
            let stockClass = StockClass()
            stockClass.symbol = symbol
            stockClass.price = price
            stockClass.companyName = companyName
            stockClass.desc = description
            self.addStockToDB(stockClass)
        
        }
    }
    
    func addStockToDB(_ stock : StockClass){
        
        
        do{
            print( db.configuration.fileURL)
            try db.write{
                db.add(stock, update: .modified)
            }
        }catch let error as NSError{
            print("Error in writing to Realm DB: \(error.localizedDescription)")
        }
    }
    
    
    
}

