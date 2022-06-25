//
//  CurrencyTable.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/27/22.
//

import UIKit

protocol CurrencyDelegate: AnyObject {
    func currency(forCurrency currency: Dictionary<String, Double>?)
}

class CurrencyTableViewController: UIViewController {
    
    weak var currencyDelegate: CurrencyDelegate?
    
    lazy var contentView = TableView().tableView
    
    var currencyList : [Model] = []
    
    var currencyDictionary = [String: Any]()
    
    var currencyKeyArray = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view = contentView
        
        contentView.delegate = self
        contentView.dataSource = self
        
        currencyData()
        
    }
    
}

extension CurrencyTableViewController {
    
    func currencyData() {
        
        guard let url = URL(string: "http://data.fixer.io/api/latest?access_key=1997ee1dbb1e2a2a84726bc72873fafe&format=1") else {
            print("URL Failed")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if data != nil {
                
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                    
                    if let rates = jsonResponse["rates"] as? [String : Any] {
                        // print(rates)
                        self.currencyDictionary = rates
                        for i in rates.keys {
                            self.currencyKeyArray.append(i)
                            
                        }
                        self.currencyKeyArray = self.currencyKeyArray.sorted()
                        print(rates)
                        
                        if let cad = rates["CAD"] as? Double {
                            print("CAD: \(cad)")
                        }
                        DispatchQueue.main.async {
                            self.contentView.reloadData()
                            
                        }
                    }
                } catch {
                    print("Error!")
                }
            }
        }.resume()
    }
}

extension CurrencyTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencyDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(self.currencyKeyArray[indexPath.row]) : \(String(self.currencyDictionary[currencyKeyArray[indexPath.row]] as! Double))"
        return cell
    }
    
}


