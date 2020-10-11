//
//  ApiRouter.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

enum ApiRouter {

    case getOffers
    case getOfferDetail(offerDetailNumber: String)

    var scheme: String {
        return "https"
    }

    var host: String {
        switch self {
        case .getOffers, .getOfferDetail:
            return "www.nasable.com"
        }
    }

    var path: String {
        switch self {
        case .getOffers:
            return "/luckytest/api/offers"
        case .getOfferDetail(let offerDetailNumber):
            return "/luckytest/api/offers/\(offerDetailNumber)"
        }
    }
}

