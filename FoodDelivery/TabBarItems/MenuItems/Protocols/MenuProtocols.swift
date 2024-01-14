//
//  MenuProtocols.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

protocol MenuViewProtocol {
    var presenter: MenuPresenterProtocol? { get set }
    
    func getData(data: [TestModel])
    func newData(data: [TestModel]?)
}

protocol MenuPresenterProtocol {
    var view: MenuViewProtocol? { get set }
    var interactor: MenuInteractorInputProtocol? { get set }
    var coordinator: AppCoordinatorProtocol? { get set }

    func viewDidLoad()
    func addData(page: Int)
    
    func setFilter(value: Int)
}

protocol MenuInteractorInputProtocol {
    var presenter: MenuInteractorOutputProtocol? { get set }
    var network: NetworkProtocol? { get set }
    
    func showListProducts()
    func getNewData(page: Int)
    func searchFilter(value: Int)
}

protocol MenuInteractorOutputProtocol {
    func didRetrieveSongs(data: [TestModel])
    func transmissionNewData(data: [TestModel]?)
}
