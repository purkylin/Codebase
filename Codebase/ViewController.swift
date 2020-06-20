//
//  ViewController.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let reuseIdentifier = "cell"
    
    private var items = [(String, UIViewController.Type)]()
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.tableFooterView = UIView()
        v.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        v.dataSource = self
        v.delegate = self
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Purkylin King"
        
        view.addSubview(tableView)
        tableView.secret.pin()
        
        loadData()
        tableView.reloadData()
        
        let item = UIBarButtonItem(title: "test", style: .plain, target: self, action: #selector(btnItemClicked))
        self.navigationItem.rightBarButtonItem = item
    }
    
    func loadData() {
        self.items = [
            ("Timer", TimerViewController.self),
            ("Collection", CollectionViewController.self)
        ]
    }
    
    @objc func btnItemClicked() {
        print("clicked")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let name = items[indexPath.row].0
        cell.textLabel?.text = name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = items[indexPath.row].1.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
