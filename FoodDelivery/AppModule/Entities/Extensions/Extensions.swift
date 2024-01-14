//
//  Extensions.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

//MARK: - Data
extension Data {
    func prettyPrintJson() {
        do {
            let json = try JSONSerialization.jsonObject(with: self,
                                                        options: [])
            let data = try JSONSerialization.data(withJSONObject: json,
                                                  options: .prettyPrinted)
            guard let jsonString = String(data: data,
                                          encoding: .utf8) else {
                print("Inavlid data")
                return
            }
            print(jsonString)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
//MARK: - UIFont
extension UIFont {
    enum SFUIDisplay: String {
        case bold = "SFUIText-Bold"
        case regular = "sf-ui-display-regular"
    }
    class func sfUiDisplay(ofSize fonsize: CGFloat,
                            weight: SFUIDisplay) -> UIFont {
        return UIFont(name: weight.rawValue,
                      size: fonsize) ?? .systemFont(ofSize: fonsize)
    }
}
