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
    case getOfferDetail(_ completeUrl: String)

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
        case .getOfferDetail:
            return ""
        }
    }
    
    var completeUrl: String? {
        switch self {
        case .getOffers:
            return nil
        case .getOfferDetail(let url):
            return url
        }
    }
}

