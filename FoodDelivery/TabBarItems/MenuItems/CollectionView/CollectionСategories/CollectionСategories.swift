//
//  CollectionСategories.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

class CollectionСategories: UIView {
    
    var presenter: MenuPresenterProtocol?
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 88,
                                height: 42)
        layout.sectionInset = .init(top: 10,
                                    left: 10,
                                    bottom: 0,
                                    right: 10)
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "lightGray")
        return collectionView
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        setupeСollectionView()
        setupeConstraint()
        self.backgroundColor = .systemPink
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - extension
private extension CollectionСategories {
    private func setupeСollectionView() {
        self.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
//MARK: - CollectionViewDataSource
extension CollectionСategories: UICollectionViewDataSource,
                                UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! CollectionViewCell
        let model = categories[indexPath.item]
        cell.titleLabel.text = "adv > \(model.value)"
        cell.titleLabel.textColor = UIColor(named: "lightPinc")
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = UIColor(named: "lightPinc")?.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
//MARK: - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let collectionView = self.collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        let model = categories[indexPath.item]
        collectionView?.tag += 1
        if collectionView?.tag == 1 {
            UIView.animate(withDuration: 0.2,
                         delay: 0,
                         options: .curveEaseOut,
                         animations: {
            collectionView?.transform = CGAffineTransform(scaleX: 0.95,
                                                          y: 0.95)
            collectionView?.backgroundColor = UIColor(named: "lightPinc")
            collectionView?.layer.borderColor = UIColor.clear.cgColor
            collectionView?.titleLabel.textColor = UIColor(named: "pinc")
        }, completion: { finished in
            self.presenter?.setFilter(value: model.value)
        })} else {
            collectionView?.tag = 0
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                collectionView?.transform = CGAffineTransform(scaleX: 1,
                                                              y: 1)
                collectionView?.backgroundColor = .white
                collectionView?.layer.borderColor = UIColor(named: "lightPinc")?.cgColor
                collectionView?.titleLabel.textColor = UIColor(named: "lightPinc")
            }, completion: nil)
        }
    }
}
