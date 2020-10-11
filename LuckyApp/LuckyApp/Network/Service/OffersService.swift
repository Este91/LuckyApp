//
//  OffersService.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

final class OffersService {
    func getOffers(completion: ((Result<Offers, Error>) -> ())? = nil) {
        NetworkLayer.request(router: ApiRouter.getOffers) { (result: Result<Offers, Error>) in
            completion?(result)
        }
    }
}
