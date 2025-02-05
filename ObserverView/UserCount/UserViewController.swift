//
//  UserViewController.swift
//  SeSACSevenWeek
//
//  Created by Jack on 2/5/25.
//

import UIKit
import SnapKit

class UserViewController: UIViewController {
    
    private var people: [Person] = []
    
    private var userView = UserCountView()
    private var userModel = UserCountViewModel()
    
    override func loadView() {
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = userModel.title
        setupTableView()
        setupActions()
    }
    
    
    
    private func setupTableView() {
        userView.tableView.delegate = self
        userView.tableView.dataSource = self
    }
    
    private func setupActions() {
        userView.loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
        userView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        userView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loadButtonTapped() {
        userModel.loadButtonTapped.value = ()
        userView.tableView.reloadData()
    }
    
    @objc private func resetButtonTapped() {
        userModel.people.removeAll()
        userView.tableView.reloadData()
    }
    
    @objc private func addButtonTapped() {
        userModel.addButtonTapped.value = ()
        userView.tableView.reloadData()
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModel.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = userModel.people[indexPath.row]
        cell.textLabel?.text = "\(person.name), \(person.age)세"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var del = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            
            self.userModel.swipeButtonTapped.value = indexPath.row
            tableView.reloadData()
            
            success(true)
        }
        
        del.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [del])
    }
}
