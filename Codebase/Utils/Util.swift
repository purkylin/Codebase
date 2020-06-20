//
//  Util.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

// Delay some seconds to execute the task
func after(_ seconds: TimeInterval, task: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: task)
}

func makePlacehoder(size: CGSize, radius: CGFloat = 9.0) -> UIImage? {
    let render = UIGraphicsImageRenderer(size: size)
    return render.image { _ in
        let path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: radius)
        UIColor(hex: "#F0F0F4").setFill()
        path.fill()
    }
}
