//
//  ViewController.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    var contentView = ContentView()
    
    let tableViewController = TableViewController()
    
    
    override func loadView() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view = contentView
        view.backgroundColor = .blue
        setUp()
        
    }
    
    
    func setUp() {
        
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        addChild(tableViewController)
        contentView.tableContainerView.addSubview(tableViewController.view)
        tableViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
        
            tableViewController.view.topAnchor.constraint(equalTo: contentView.tableContainerView.topAnchor),
            tableViewController.view.leadingAnchor.constraint(equalTo: contentView.tableContainerView.leadingAnchor),
            tableViewController.view.bottomAnchor.constraint(equalTo: contentView.tableContainerView.bottomAnchor),
            tableViewController.view.trailingAnchor.constraint(equalTo: contentView.tableContainerView.trailingAnchor)
            
        ])
        

        
    }
    

    
}

