//
//  NetworkLayer.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

struct NetworkLayer {
    static func request<T: Codable>(router: ApiRouter, completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)

        let session = URLSession(configuration: .default)

        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            guard (200...299).contains(response.statusCode) else {
                var message = ""
                do {
                    let responseData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                    if let responseMessage = responseData?["message"] as? String {
                        message = responseMessage
                    }
                } catch let error as NSError {
                    print(error)
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseObject = try decoder.decode(T.self, from: data)
                completion(.success(responseObject))
            } catch let error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }

        dataTask.resume()
    }
}
