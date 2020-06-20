//
//  TimerViewController.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    private let label = UILabel().font(size: 17).color(.red)
    private var timer: DispatchSourceTimer!
    private weak var timer3: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        label.text = "Hello World"
        label.secret.pinCenter()
        
        self.title = "First"
        view.backgroundColor = .white
        
        setupTimer()
    }
    
    func setupTimer() {
        // can auto deinit and can invalid timer
        timer = DispatchSource.makeTimerSource()
        timer.setEventHandler {
            print("triger")
        }
        
        timer.schedule(deadline: .now(), repeating: .seconds(1))
        timer.resume()
    }
    
    func setupTimer2() {
        // can auto deinit but can not invalid timer
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            print("triger 2")
        }
    }
    
    func setupTimer3() {
        // can not auto deinit and invalidate
        timer3 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
    }
    
    @objc func onTimer() {
        print("triger 3")
    }
    
    deinit {
        print("deinit")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        timer3.invalidate()
    }
}
