//
//  CollectionViewCell.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
//MARK: - UIImageView
    var imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
//MARK: - UILabel
     var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
         label.font = .sfUiDisplay(ofSize: 13,
                                   weight: .regular)
        return label
    }()
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1,
                                         height: 1)
        initialization()
        setupeConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension CollectionViewCell {
//MARK: - initialization
    func initialization() {
        self.addSubview(titleLabel)
        self.addSubview(imageView)
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}

