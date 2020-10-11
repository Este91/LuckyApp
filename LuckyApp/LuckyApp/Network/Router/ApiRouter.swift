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

    var scheme: String {
        return "https"
    }

    var host: String {
        switch self {
        case .getOffers:
            return "www.nasable.com"
        }
    }

    var path: String {
        switch self {
        case .getOffers:
            return "/luckytest/api/offers"
        }
    }
}

