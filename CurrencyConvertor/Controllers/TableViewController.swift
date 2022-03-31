//
//  CurrencyTable.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/27/22.
//

import UIKit

class TableViewController: UIViewController {
    
    lazy var contentView = TableView().tableView
    
    override func loadView() {
        
        super.loadView()
        view = contentView
        
        contentView.delegate = self
        contentView.dataSource = self
        
    }
    
    
}


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Huloo"
        cell.detailTextLabel?.text = "SubText"
        return cell
    }
    
}
