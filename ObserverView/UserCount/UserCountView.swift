//
//  UserCountView.swift
//  ObserverView
//
//  Created by youngkyun park on 2/5/25.
//

import UIKit

class UserCountView: UIView {

 
     let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 60
        table.register(UITableViewCell.self, forCellReuseIdentifier: "PersonCell")
        return table
    }()
    
    let loadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()

    
    // 선언할 때, 버튼을 넣기 위해서 lazy 사용
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loadButton, resetButton, addButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
   
        
        [buttonStackView, tableView].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    
}
