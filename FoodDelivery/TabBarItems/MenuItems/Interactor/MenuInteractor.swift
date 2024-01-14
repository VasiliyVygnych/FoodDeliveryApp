//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import Foundation

class MenuInteractor: MenuInteractorInputProtocol {
    
    var presenter: MenuInteractorOutputProtocol?
    var network: NetworkProtocol?
    
//MARK: - showListProducts
    func showListProducts() {
        network?.dataFetch(completion: { [ weak self ] data in
            DispatchQueue.main.async {
                guard let model = data else { return }
                self?.presenter?.didRetrieveSongs(data: model)
            }
        })
    }
//MARK: - getNewData
    func getNewData(page: Int) {
        network?.samplingNewData(page: page,
                                 completion: { [ weak self ] data in
            DispatchQueue.main.async {
                self?.presenter?.transmissionNewData(data: data)
            }
        })
    }
//MARK: - searchFilter
    func searchFilter(value: Int) {
        network?.searchFilter(abv: value,
                              completion: { [ weak self ] data in
            DispatchQueue.main.async {
                guard let model = data else { return }
                self?.presenter?.didRetrieveSongs(data: model)
            }
        })
    }
}
