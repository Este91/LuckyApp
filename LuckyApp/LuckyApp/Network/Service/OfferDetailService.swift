//
//  OfferDetailService.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 11/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

final class OfferDetailService {
    
    var offerDetail: OfferDetail?
    
    func getOfferDetail(completion: ((Result<OfferDetail, Error>) -> ())? = nil) {
        NetworkLayer.request(router: ApiRouter.getOfferDetail(offerDetailNumber: "7")) { [weak self] (result: Result<OfferDetail, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let offerDetail):
                print("success")
                self.offerDetail = offerDetail
            case .failure(let error):
                print(error)
            }
            completion?(result)
        }
    }
}
