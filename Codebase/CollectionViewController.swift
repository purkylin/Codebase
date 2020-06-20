//
//  CollectionViewController.swift
//  Codebase
//
//  Created by Purkylin King on 2020/6/19.
//  Copyright © 2020 Purkylin King. All rights reserved.
//

import UIKit

enum LayoutType: String, CaseIterable {
    case grid
    case pageGrid
}

class CollectionViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = KingGridLayout(widthDimension: .absolute(constant: 60), heightDimension: .fractionalWidth(ratio: 1.0))
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.contentInsetAdjustmentBehavior = .never
        v.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        v.dataSource = self
        v.delegate = self
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.secret.pin()
        
        let barItem = UIBarButtonItem(title: "Layout", style: .plain, target: self, action: #selector(btnChangeLayoutClicked))
        self.navigationItem.rightBarButtonItem = barItem
        self.title = "Collection"
    }
    
    @objc func btnChangeLayoutClicked() {
        let vc = UIAlertController(title: "Change Layout", message: nil, preferredStyle: .actionSheet)
        
        for type in LayoutType.allCases {
            vc.addAction(.init(title: type.rawValue, style: .default, handler: { [weak self] _ in
                self?.changeLayout(to: type)
            }))
        }

        vc.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func changeLayout(to type: LayoutType) {
        switch type {
        case .grid:
            let layout = KingGridLayout(widthDimension: .absolute(constant: 60), heightDimension: .fractionalWidth(ratio: 1.0))
            collectionView.setCollectionViewLayout(layout, animated: true)
        case .pageGrid:
            let layout = PageGridLayout()
            layout.columns = 4
            layout.rows = 4
            collectionView.setCollectionViewLayout(layout, animated: true)
            
            break
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        cell.update(title: "cell \(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked at \(indexPath.row)")
    }
}

private class CustomCell: UICollectionViewCell {
    private let label = UILabel().font(size: 17).background(.lightGray).align(.center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(label)
        label.secret.pin()
    }
    
    func update(title: String) {
        self.label.text = title
    }
}
