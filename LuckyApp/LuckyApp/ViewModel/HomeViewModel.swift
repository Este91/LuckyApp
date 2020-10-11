//
//  HomeViewModel.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 11/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

final class HomeViewModel: NSObject {
    
    private let offersService = OffersService()
    private let offerDetailService = OfferDetailService()
    var offers: Offers?
    var offerDetail: OfferDetail?
    weak var delegate: HomeViewModelDataProtocol?
}

// MARK: Services
extension HomeViewModel {
    func getOffers(completion: ((Result<Offers, Error>) -> ())? = nil) {
        offersService.getOffers() { [weak self] (result: Result<Offers, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let offers):
                self.offers = offers
                self.delegate?.offersDataUpdated()
            case .failure(let error):
                print(error)
            }
            completion?(result)
        }
    }
    
    func getOfferDetail(offerDetailId: String, completion: ((Result<OfferDetail, Error>) -> ())? = nil) {
        offerDetailService.getOfferDetail(offerDetailId) { [weak self] (result: Result<OfferDetail, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let offerDetail):
                self.offerDetail = offerDetail
                self.delegate?.offerDetailDataUpdated()
            case .failure(let error):
                print(error)
            }
            completion?(result)
        }
    }
}
