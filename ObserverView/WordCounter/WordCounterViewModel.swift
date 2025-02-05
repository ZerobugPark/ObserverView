//
//  WordCounterViewModel.swift
//  ObserverView
//
//  Created by youngkyun park on 2/5/25.
//

import Foundation


class WordCounterViewModel {
    
    
    var inputText: Observable<Int> = Observable(0)
    var outputText: Observable<Int> = Observable(0)
    
    
    init() {
        inputText.bind { texts in
            self.validation(count: texts)
        }
    }
    
    private func validation(count: Int) {

        outputText.value = count
        
    }
    
}
