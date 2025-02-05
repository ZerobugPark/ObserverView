//
//  CurrencyViewModel.swift
//  ObserverView
//
//  Created by youngkyun park on 2/5/25.
//

import Foundation


class CurrencyViewModel {
    
    
    var inputTextField: Observable<String?> = Observable(nil)
    
    var outputLable: Observable<String> = Observable("")
    
    init() {
        
        inputTextField.lazyBind { amountTxt in
            print(#function, "inputTextField")
            self.exchange(amountTxt: amountTxt)
        }
        
    }
    
    
    private func exchange(amountTxt: String?) {
        
        // 일단 nil인지 판단
        // 그다음 숫자인지 판단
        
        let exchange = 1450.0
        guard let amount = amountTxt else {
            //outputLable.value = "테스트"
            return
        }
        
        guard let amountDouble = Double(amount) else {
            outputLable.value = "올바른 금액을 입력해주세요"
            return
        }
        
        let result = amountDouble / exchange
        outputLable.value = String(format: "%.2f USD (약 $%.2f)", result, result)
        
        
        
    }
}
