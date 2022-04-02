//
//  CurrencyTable.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/27/22.
//

import UIKit

class TableViewController: UIViewController {
    
    lazy var contentView = TableView().tableView
    
    var currencyCount = Int()
    
    override func loadView() {
        
        super.loadView()
        view = contentView
        
        contentView.delegate = self
        contentView.dataSource = self
        fetchData()
        
    }
    
    func fetchData () -> [String: Any] {
        
        var currencyDictionary = [String: Any]()
        
        // 1. Adim
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=1997ee1dbb1e2a2a84726bc72873fafe&format=1")
        
        // Aga git al gel
        let session = URLSession.shared
        
        // Clousure
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print("error")
            } else {
                
                // 2. Adim
                if data != nil {
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                // print(rates)
                                self.currencyCount = rates.count
                                
                                
                                if let cad = rates["CAD"] as? Double {
                                    print("CAD: \(cad)")
                                    
                                }
                            }
                        }
                        
                    } catch {
                        print("Error!")
                    }
                }
            }
        }.resume()

        return currencyDictionary
    }
    
}


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(currencyCount)
        return currencyCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Huloo"
        cell.detailTextLabel?.text = "SubText"
        return cell
    }
    
}
