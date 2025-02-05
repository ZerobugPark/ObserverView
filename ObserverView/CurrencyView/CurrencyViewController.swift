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
 
    override func loadView() {
        view = currencyView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
     

    
//    private func setupActions() {
//        convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
//    }
//     
//    @objc private func convertButtonTapped() {
//        guard let amountText = amountTextField.text,
//              let amount = Double(amountText) else {
//            resultLabel.text = "올바른 금액을 입력해주세요"
//            return
//        }
//        
//        let exchangeRate = 1350.0 // 실제 환율 데이터로 대체 필요
//        let convertedAmount = amount / exchangeRate
//        resultLabel.text = String(format: "%.2f USD (약 $%.2f)", convertedAmount, convertedAmount)
//    }
}
