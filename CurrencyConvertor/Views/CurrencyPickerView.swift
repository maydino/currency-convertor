//
//  CurrencyPicker.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/20/22.
//

import UIKit

import UIKit


class CurrencyPickerView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - UI Properties
    
    let currencyPickerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemPink
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let amountLabel: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "amount"
        textField.backgroundColor = .lightGray
        textField.textAlignment = .center
        return textField
    }()
    
    let currencyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .green
        return picker
    }()
    
    let getCurrencies: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .red
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        setUpView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Methods

    private func setUpView() {
        
        currencyPickerStackView.addSubview(currencyPicker)
        currencyPickerStackView.addSubview(amountLabel)
        
        addSubview(currencyPickerStackView)
        
        NSLayoutConstraint.activate([
            
            currencyPickerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            currencyPickerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            currencyPickerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            currencyPickerStackView.heightAnchor.constraint(equalToConstant: 180),
            
            
            amountLabel.centerXAnchor.constraint(equalTo: currencyPickerStackView.centerXAnchor, constant: 0),
            amountLabel.topAnchor.constraint(equalTo: currencyPickerStackView.topAnchor, constant: 0),
            amountLabel.heightAnchor.constraint(equalToConstant: 50),
            amountLabel.widthAnchor.constraint(equalToConstant: 200),
            
            currencyPicker.centerXAnchor.constraint(equalTo: currencyPickerStackView.centerXAnchor, constant: 0),
            currencyPicker.bottomAnchor.constraint(equalTo: currencyPickerStackView.bottomAnchor, constant: 0),
            currencyPicker.heightAnchor.constraint(equalToConstant: 120)
            
            
        ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 10
        } else {
            return 50
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "First \(row)"
        } else {
            return "Second \(row)"
        }
    }
    
    
}

