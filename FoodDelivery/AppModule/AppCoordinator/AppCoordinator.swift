//
//  AppCoordinator.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: AppAssemblerProtocol
    
    init(navigationController: UINavigationController?,
         assembler: AppAssemblerProtocol = AppAssembler()) {
        self.navigationController = navigationController
        self.assembler = assembler
    }
//MARK: - initialView
    func initialView() {
        if let navigationController = navigationController {
            let tabBar = assembler.createTabBar(router: self)
            let menu = assembler.createMenuItems(coordinator: self)
            let contact = assembler.createContactsItems(coordinator: self)
            let profile = assembler.createProfileItems(coordinator: self)
            let cart = assembler.createCartItems(coordinator: self)
            tabBar.viewControllers = [menu,
                                      contact,
                                      profile,
                                      cart]
            navigationController.viewControllers = [tabBar]
        }
    }
}
