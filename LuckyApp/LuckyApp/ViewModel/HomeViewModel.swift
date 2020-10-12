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
    private var offers: Offers?
    private var offerDetail: OfferDetail?
    weak var delegate: HomeViewModelDataProtocol?
}

// MARK: Services
extension HomeViewModel {
    func getOffersData(completion: ((Result<Offers, Error>) -> ())? = nil) {
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
    
    func getOfferDetailData(_ offerDetailUrl: String, completion: ((Result<OfferDetail, Error>) -> ())? = nil) {
        offerDetailService.getOfferDetail(offerDetailUrl) { [weak self] (result: Result<OfferDetail, Error>) in
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

// MARK: CellData
extension HomeViewModel {
    func dataForCellAt(indexPath: IndexPath) -> Item? {
        if let offersDto = offers {
            return OffersViewModel(offersDto).getItem(indexPath: indexPath)
        }
        return nil
    }
    
    func dataForSectionCellAt(indexPath: IndexPath) -> String {
        return offers?.sections[indexPath.section].title ?? ""
    }
}

// MARK: Publics
extension HomeViewModel {
    func getOffers() -> Offers? {
        return offers
    }
    
    func getDetailUrl(_ indexPath: IndexPath) -> String {
        return offers?.sections[indexPath.section].items[indexPath.row - 1].detailUrl ?? ""
    }
}
