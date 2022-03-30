//
//  TableView.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/28/22.
//

import Foundation
import UIKit

class TableView: UIView {
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemPink
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Set Up Methot
    
    func setUpTable() {
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            
        ])
    }
    
}


