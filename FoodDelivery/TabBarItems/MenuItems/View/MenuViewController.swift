//
//  MenuViewController.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {

    var presenter: MenuPresenterProtocol?
    var stackViews: [UIView] = []
    
    var model: [TestModel]? {
        didSet {
            tableView.reloadData()
        }
    }
 
//MARK: - UIStackView
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = UIColor(named: "lightGray")
        return view
    }()
//MARK: - customView
    private var collectionBanners: СollectionBanners = {
       let view = СollectionBanners()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var collectionСategories: CollectionСategories = {
       let view = CollectionСategories()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//MARK: - UITableView
    private var tableView: UITableView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 180
        view.bounces = false
        view.allowsSelection = false
        view.showsVerticalScrollIndicator = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
//MARK: - UIButton
    var navigationButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.black,
                             for: .normal)
        button.setTitle("Москва",
                        for: .normal)
        return button
    }()
//MARK: - imageButton
    private var imageButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrow.down")
        image.tintColor = .black
        return image
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightGray")
        setupeView()
        setupeTableView()
        setupeConstraint()
        setupeButton()
        presenter?.viewDidLoad()
        navigationController?.navigationBar.addSubview(navigationButton)
    }
//MARK: - setupeTableView
    private func setupeTableView() {
        tableView.backgroundColor = UIColor(named: "lightGray")
        tableView.register(TableViewCell.self,
                            forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
//MARK: - setupeView
    private func setupeView() {
        view.addSubview(stackView)
        view.addSubview(navigationButton)
        view.addSubview(tableView)
        navigationButton.addSubview(imageButton)
        stackView.addArrangedSubview(collectionBanners)
        stackView.addArrangedSubview(collectionСategories)
        collectionBanners.isHidden = false
        stackViews.append(collectionBanners)
    }
//MARK: - setupeButton
    private func setupeButton() {
        navigationButton.addTarget(self,
                                   action: #selector(choosingCity),
                                   for: .touchUpInside)
    }
    @objc func choosingCity() {
      print("choosingCity")
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        navigationButton.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.left.equalTo(16)
        }
        imageButton.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(8)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(104)
            make.width.equalToSuperview()
        }
        collectionBanners.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
//            make.height.lessThanOrEqualTo(180)
            make.height.equalTo(180)
        }
        collectionСategories.snp.makeConstraints { make in
            make.top.equalTo(collectionBanners.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(70)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionСategories.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
//MARK: - extension MenuViewProtocol
extension MenuViewController: MenuViewProtocol {
    func getData(data: [TestModel]) {
        self.model = data
        self.collectionСategories.presenter = presenter
    }
    func newData(data: [TestModel]?) {
        guard let model = data else { return }
        self.model?.append(contentsOf: model)
    }
}
//MARK: - extension UITableViewDelegate & UITableViewDataSource
extension MenuViewController: UITableViewDelegate,
                             UITableViewDataSource {
//MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        model?.count ?? 0
    }
//MARK: - cellForRowAt
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! TableViewCell
        guard let model = model?[indexPath.row] else { return UITableViewCell() }
        cell.configuration(model: model)
        cell.selectButton.tag = indexPath.row
        return cell
    }
//MARK: - willDisplay
    func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        guard var pageCount = model?.count else { return }
        let total = 80
        if indexPath.row == (model?.count ?? 0) - 3 && model?.count ?? 0 < total {
               pageCount += 10
            presenter?.addData(page: pageCount)
            self.tableView.insertRows(at: [indexPath],
                                      with: .fade)
        }
        
        
        
        if indexPath.row == 4 {
            stackViews.forEach { buttom in
                UIView.animate(withDuration: 0.2) {
                    buttom.isHidden = !buttom.isHidden
                    self.stackView.layoutIfNeeded()
                }
            }
        }
        
    }
}
