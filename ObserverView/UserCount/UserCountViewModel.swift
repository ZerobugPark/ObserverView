//
//  UserCountViewModel.swift
//  ObserverView
//
//  Created by youngkyun park on 2/5/25.
//

import Foundation

class UserCountViewModel {
    
    let title = "Person List"
    let names = ["James", "Mary", "John", "Patricia", "Robert", "Jennifer", "Michael", "Linda", "William", "Elizabeth", "David", "Barbara", "Richard", "Susan", "Joseph", "Jessica", "Thomas", "Sarah", "Charles", "Karen"]
    
    var people: Observable<[Person]> = Observable([])
  
    var inputloadButtonTapped: Observable<Void> = Observable(())
    var inputaddButtonTapped: Observable<Void> = Observable(())
    var inputResetButtonTapped: Observable<Void> = Observable(())
    var inputswipeButtonTapped: Observable<Int> = Observable((0))
    
    
    
    
    
    init() {
        inputloadButtonTapped.lazyBind { _ in
            self.updateData(status: true)
        }
        inputaddButtonTapped.lazyBind { _ in
            self.updateData(status: false)
        }
        inputResetButtonTapped.lazyBind { index in
            self.people.value.removeAll()
        }
        
        inputswipeButtonTapped.lazyBind { index in
            self.removeData(num: index)
        }
        
    }
    
    private func updateData(status: Bool) {
        
        if status {
            people.value = loadData()
        } else {
            let person = Person(name: names.randomElement()!, age: Int.random(in: 20...70))
            people.value.append(person)
        }
        
    }
    
    private func loadData() -> [Person] {
        return [
            Person(name: "James", age: Int.random(in: 20...70)),
            Person(name: "Mary", age: Int.random(in: 20...70)),
            Person(name: "John", age: Int.random(in: 20...70)),
            Person(name: "Patricia", age: Int.random(in: 20...70)),
            Person(name: "Robert", age: Int.random(in: 20...70))
        ]
    }
    
    private func removeData(num: Int) {
        
        people.value.remove(at: num)
    }
    
    
}
