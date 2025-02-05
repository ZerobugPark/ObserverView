//
//  Observable.swift
//  ObserverView
//
//  Created by youngkyun park on 2/5/25.
//

import Foundation


class Observable<T> {
    
    
    var closuer: ((T)->(Void))?
    
    var value: T  {
        didSet {
            closuer?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closuer: @escaping (T)->(Void)) {
        closuer(value)
        self.closuer = closuer
    }
    
    func lazyBind(_ closuer: @escaping (T)->(Void)) {
        self.closuer = closuer
    }
    
    
    
    
    
}
