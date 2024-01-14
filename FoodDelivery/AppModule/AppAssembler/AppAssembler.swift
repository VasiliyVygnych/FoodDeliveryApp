//
//  AppAssembler.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

class AppAssembler: AppAssemblerProtocol {
    
//MARK: - createTabBar
    func createTabBar(router: AppCoordinatorProtocol) -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.tabBar.tintColor = UIColor.systemPink
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        return tabBar
    }
//MARK: - createMenuItems
    func createMenuItems(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = MenuViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        var presenter: MenuPresenterProtocol & MenuInteractorOutputProtocol = MenuPresenter()
        var interactor: MenuInteractorInputProtocol = MenuInteractor()
        let network: NetworkProtocol = Network()
        let coordinator = coordinator
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        viewController.tabBarItem = UITabBarItem(title: "",
                                                 image: UIImage(named: "items0"),
                                                 tag: 0)
//        return viewController
        return navigation
    }
//MARK: - createContactsItems
    func createContactsItems(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = ContactsViewController()
        viewController.tabBarItem = UITabBarItem(title: "",
                                                 image: UIImage(named: "items1"),
                                                 tag: 1)
        return viewController
    }
//MARK: - createProfileItems
    func createProfileItems(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = ProfileViewController()
        viewController.tabBarItem = UITabBarItem(title: "",
                                                 image: UIImage(named: "items2"),
                                                 tag: 2)
        return viewController
    }
//MARK: - createCartItems
    func createCartItems(coordinator: AppCoordinatorProtocol) -> UIViewController {
        let viewController = CartViewController()
        viewController.tabBarItem = UITabBarItem(title: "",
                                                 image: UIImage(named: "items3"),
                                                 tag: 3)
        return viewController
    }
}
