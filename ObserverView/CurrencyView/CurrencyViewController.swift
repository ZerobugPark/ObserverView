//
//  CurrencyViewController.swift
//  SeSACSevenWeek
//
//  Created by Jack on 2/5/25.
//

import UIKit

import SnapKit

class CurrencyViewController: UIViewController {
    
    let currencyView = CurrencyView()
    let currencyModel = CurrencyViewModel()
    
    override func loadView() {
        view = currencyView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        
        currencyModel.outputLable.lazyBind { value in
            self.currencyView.resultLabel.text = (value)
        }
    }
     

    
    private func setupActions() {
        currencyView.convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
    }
     
    @objc private func convertButtonTapped() {
        currencyModel.inputTextField.value = currencyView.amountTextField.text
    }
}
