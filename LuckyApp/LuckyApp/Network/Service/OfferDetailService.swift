//
//  OfferDetailService.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 11/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

final class OfferDetailService {
    func getOfferDetail(_ offerDetailUrl: String, completion: ((Result<Detail, Error>) -> ())? = nil) {
        NetworkLayer.request(router: ApiRouter.getOfferDetail(offerDetailUrl)) { (result: Result<Detail, Error>) in
            completion?(result)
        }
    }
}
