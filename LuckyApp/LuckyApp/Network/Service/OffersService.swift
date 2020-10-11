//
//  OffersService.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

final class OffersService {
    
    var offers: Offers?
    
    func getOffers(completion: ((Result<Offers, Error>) -> ())? = nil) {
        NetworkLayer.request(router: ApiRouter.getOffers) { [weak self] (result: Result<Offers, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let offers):
                print("success")
                self.offers = offers
            case .failure(let error):
                print(error)
            }
            completion?(result)
        }
    }
}
