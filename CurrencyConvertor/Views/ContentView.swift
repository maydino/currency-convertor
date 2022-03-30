//
//  ContentView.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/28/22.
//

import UIKit


class ContentView: UIView {
    
    // MARK: - UI Properties
    
    let currencyPickerView: CurrencyPickerView = {
        let view = CurrencyPickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
 
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setUpView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Methods

    private func setUpView() {
        
        addSubview(currencyPickerView)
        addSubview(tableContainerView)
    
        
        NSLayoutConstraint.activate([
            
            currencyPickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            currencyPickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            currencyPickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            currencyPickerView.heightAnchor.constraint(equalToConstant: 200),
            
            tableContainerView.topAnchor.constraint(equalTo: currencyPickerView.bottomAnchor, constant: 10),
            tableContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableContainerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
 
    
}
