//
//  TableViewCell.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit
import SnapKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
// MARK: - UILabel
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sfUiDisplay(ofSize: 17,
                                  weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sfUiDisplay(ofSize: 13,
                                  weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sfUiDisplay(ofSize: 13,
                                  weight: .regular)
        label.textColor = UIColor(named: "pinc")
        return label
    }()
//MARK: - UIButton
    var selectButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor(named: "pinc")?.cgColor
        button.layer.borderWidth = 1
//        button.setTitleColor(UIColor(named: "pinc"),
//                             for: .normal)
        return button
    }()
// MARK: - UIImageView
   private var imagePreview: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFit
       return image
    }()
// MARK: - configuration
    func configuration(model: TestModel) {
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        
        let imageUrl = URL(string: model.imageURL)
        imagePreview.sd_setImage(with: imageUrl,
                                 placeholderImage: UIImage(systemName: ""))
        buttonLabel.text = "free :)"
    }
// MARK: - init
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(imagePreview)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(selectButton)
        selectButton.addSubview(buttonLabel)
        setupeConstraint()
        setupeButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - setupeButton
    private func setupeButton() {
        selectButton.addTarget(self,
                               action: #selector(add),
                               for: .touchUpInside)
    }
    @objc func add() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.selectButton.transform = CGAffineTransform(scaleX: 0.70,
                                                 y: 0.70)
            self.selectButton.backgroundColor = UIColor(named: "lightPinc")
            self.selectButton.layer.borderColor = UIColor.clear.cgColor
            }, completion: { finished in
                print("select position - \(self.selectButton.tag)")
        })
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.selectButton.transform = CGAffineTransform(scaleX: 1,
                                                 y: 1)
            self.selectButton.backgroundColor = .white
            self.selectButton.layer.borderColor = UIColor(named: "pinc")?.cgColor
        }, completion: nil)
    }
// MARK: - setupeConstraint
    private func setupeConstraint() {
        imagePreview.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.width.height.equalTo(132)
            make.left.equalTo(16)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(32)
            make.width.equalTo(200)
            make.height.lessThanOrEqualTo(20)
            make.left.equalTo(170)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.width.equalTo(130)
            make.height.lessThanOrEqualTo(100)
            make.left.equalTo(170)
        }
        selectButton.snp.makeConstraints { make in
            make.top.equalTo(124)
            make.width.equalTo(87)
            make.height.equalTo(32)
            make.right.equalTo(-16)
        }
        buttonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
