//
//  Network.swift
//  FoodDelivery
//
//  Created by Vasiliy Vygnych on 13.01.2024.
//

import UIKit

class Network:  NetworkProtocol {
    
//MARK: - request
    func request(urlString: URL,
                 completion: @escaping ( Result <Data, Error>) -> Void) {
        let request = URLRequest(url: urlString)
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
        }.resume()
    }
//MARK: - dataFetch
    func dataFetch(completion: @escaping ([TestModel]?) -> Void) {
        var components = URLComponents(string: "https://api.punkapi.com/v2/beers")
        components?.queryItems = [URLQueryItem(name: "page",
                                               value: String(1)),
                                  URLQueryItem(name: "per_page",
                                               value: String(20))]
        guard let url = components?.url else { return }
        request(urlString: url) { (result)  in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode([TestModel].self,
                                                         from: data)
                    completion(model)
                } catch let jsonError {
                    print("ERROR", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("ERROR DATA \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
//MARK: - samplingNewData
    func samplingNewData(page: Int,
                         completion: @escaping ([TestModel]?) -> Void) {
        var components = URLComponents(string: "https://api.punkapi.com/v2/beers")
        components?.queryItems = [URLQueryItem(name: "page",
                                               value: String(1)),
                                  URLQueryItem(name: "per_page",
                                               value: String(page))]
        guard let url = components?.url else { return }
        request(urlString: url) { (result)  in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode([TestModel].self,
                                                         from: data)
                    completion(model)
                } catch let jsonError {
                    print("ERROR", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("ERROR DATA \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
//MARK: - searchFilter
    func searchFilter(abv: Int,
                      completion: @escaping ([TestModel]?) -> Void) {
        var components = URLComponents(string: "https://api.punkapi.com/v2/beers")
        components?.queryItems = [URLQueryItem(name: "abv_gt",
                                               value: String(abv))]
        guard let url = components?.url else { return }
        request(urlString: url) { (result)  in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode([TestModel].self,
                                                         from: data)
                    completion(model)
                } catch let jsonError {
                    print("ERROR", jsonError)
                    completion(nil)
                }
            case .failure(let error):
                print("ERROR DATA \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    
    
}
