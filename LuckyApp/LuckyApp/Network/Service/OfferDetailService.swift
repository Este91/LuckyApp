//
//  OfferDetailService.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 11/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

final class OfferDetailService {
    func getOfferDetail(_ offerDetailId: String, completion: ((Result<OfferDetail, Error>) -> ())? = nil) {
        NetworkLayer.request(router: ApiRouter.getOfferDetail(offerDetailId)) { (result: Result<OfferDetail, Error>) in
            completion?(result)
        }
    }
}
