//
//  Model.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

    struct TestModel: Codable {
        let id: Int
        let name, tagline, firstBrewed, description: String
        let imageURL: String
        let abv: Double
        let volume, boilVolume: BoilVolume
        let ingredients: Ingredients
        let foodPairing: [String]
        let brewersTips, contributedBy: String

        enum CodingKeys: String, CodingKey {
            case id
            case name, tagline
            case firstBrewed = "first_brewed"
            case description
            case imageURL = "image_url"
            case abv
            case volume
            case boilVolume = "boil_volume"
            case ingredients
            case foodPairing = "food_pairing"
            case brewersTips = "brewers_tips"
            case contributedBy = "contributed_by"
        }
    }

    // MARK: - BoilVolume
    struct BoilVolume: Codable {
        let value: Double
        let unit: String
    }

    // MARK: - Ingredients
    struct Ingredients: Codable {
        let malt: [Malt]
        let hops: [Hop]
        let yeast: String
    }

    // MARK: - Hop
    struct Hop: Codable {
        let name: String
        let amount: BoilVolume
        let add, attribute: String
    }

    // MARK: - Malt
    struct Malt: Codable {
        let name: String
        let amount: BoilVolume
    }

    // MARK: - Fermentation
    struct Fermentation: Codable {
        let temp: BoilVolume
    }

    // MARK: - MashTemp
    struct MashTemp: Codable {
        let temp: BoilVolume
        let duration: Int
    }





struct AppModel {
    var category: [Category]
    var banner: [Banner]
}

struct Category {
    var value: Int
}

struct Banner {
    var image: UIImage
    
    
    
    
}

var categories = [Category(value: 4),
                  Category(value: 6),
                  Category(value: 7),
                  Category(value: 11),
                  Category(value: 12),
                  Category(value: 40)]

var banners = [Banner(image: UIImage(named: "banner0")!),
               Banner(image: UIImage(named: "banner1")!),
               Banner(image: UIImage(named: "banner2")!),
               Banner(image: UIImage(named: "banner3")!)]
