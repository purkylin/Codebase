//
//  FirstViewController.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let label = UILabel().font(size: 17).color(.red)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        label.text = "Hello World"
        label.secret.pinCenter()
        
        self.title = "First"
        view.backgroundColor = .white
    }
}
