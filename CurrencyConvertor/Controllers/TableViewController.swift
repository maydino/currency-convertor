//
//  CurrencyTable.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/27/22.
//

import UIKit


class TableViewController: UIViewController {
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemPink
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpTable()
    }
    
    func setUpTable() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            
        ])
    }
    
    
    
    
    
}


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
