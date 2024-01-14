//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

class MenuPresenter: MenuPresenterProtocol {
    
    var view: MenuViewProtocol?
    var interactor: MenuInteractorInputProtocol?
    var coordinator: AppCoordinatorProtocol?

//MARK: - viewDidLoad
    func viewDidLoad() {
        interactor?.showListProducts()
    }
//MARK: - addData
    func addData(page: Int) {
        interactor?.getNewData(page: page)
    }
//MARK: - setFilter
    func setFilter(value: Int) {
        interactor?.searchFilter(value: value)
    }
}
extension MenuPresenter: MenuInteractorOutputProtocol {
    func didRetrieveSongs(data: [TestModel]) {
        view?.getData(data: data)
    }
    func transmissionNewData(data: [TestModel]?) {
        view?.newData(data: data)
    }
    
}

