//
//  СollectionBanners.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

class СollectionBanners: UIView {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 300,
                                height: 112)
        layout.sectionInset = .init(top: 0,
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
        self.backgroundColor = .systemGreen
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - extension
private extension СollectionBanners {
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
extension СollectionBanners: UICollectionViewDataSource,
                                UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        banners.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! CollectionViewCell
        let model = banners[indexPath.item]
        cell.imageView.image = model.image
        cell.layer.cornerRadius = 10
        return cell
    }
//MARK: - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let collectionView = self.collectionView.cellForItem(at: indexPath) as? CollectionViewCell
            UIView.animate(withDuration: 0.4,
                         delay: 0,
                         options: .curveEaseOut,
                         animations: {
            collectionView?.transform = CGAffineTransform(scaleX: 0.75,
                                                          y: 0.75)
        }, completion: { finished in
            print("select \(indexPath.item) banner")
        })
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
            collectionView?.transform = CGAffineTransform(scaleX: 1,
                                                          y: 1)
        }, completion: nil)
    }
}
