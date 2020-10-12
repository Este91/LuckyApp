//
//  Detail.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 11/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

struct Detail: Codable {
    let id: Int
    let imageUrl: String
    let brand: String
    let title: String
    let tags: String?
    let favoriteCount: Int
    let description: String
    let price: Price
    let expiration: String
    let redemptionsCap: String
}
