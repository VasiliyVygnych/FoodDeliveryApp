//
//  AppProtocols.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

protocol AppAssemblerProtocol {
    func createTabBar(router: AppCoordinatorProtocol) -> UITabBarController
    func createMenuItems(coordinator: AppCoordinatorProtocol) -> UIViewController
    func createContactsItems(coordinator: AppCoordinatorProtocol) -> UIViewController
    func createProfileItems(coordinator: AppCoordinatorProtocol) -> UIViewController
    func createCartItems(coordinator: AppCoordinatorProtocol) -> UIViewController
    
}

protocol AppCoordinatorProtocol {
    func initialView()
}

protocol NetworkProtocol {
    func dataFetch(completion: @escaping ([TestModel]?) -> Void)
    func samplingNewData(page: Int,
                         completion: @escaping ([TestModel]?) -> Void)
    
    func searchFilter(abv: Int,
                      completion: @escaping ([TestModel]?) -> Void)
}
