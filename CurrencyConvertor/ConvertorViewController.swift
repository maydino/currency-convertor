//
//  ViewController.swift
//  CurrencyConvertor
//
//  Created by Mutlu Aydin on 3/20/22.
//

import UIKit

class ConvertorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let currencyPickerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemPink
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let currencyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        setUp()
    }
    
    func setUp() {
        
        currencyPickerStackView.addSubview(currencyPicker)
        
        view.addSubview(currencyPickerStackView)
        view.addSubview(getCurrencies)
        
        NSLayoutConstraint.activate([
            
            currencyPickerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            currencyPickerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            currencyPickerStackView.widthAnchor.constraint(equalToConstant: view.frame.width*0.8),
            currencyPickerStackView.heightAnchor.constraint(equalToConstant: 400),
            
            currencyPicker.centerXAnchor.constraint(equalTo: currencyPickerStackView.centerXAnchor, constant: 0),
            
            currencyPicker.centerYAnchor.constraint(equalTo: currencyPickerStackView.centerYAnchor, constant: 0)
            
            
        ])
    }
    
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 5
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

