//
//  Item.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

struct Item: Codable {
    let detailUrl: String
    let imageUrl: String
    let brand: String
    let title: String
    let tags: String?
    let favoriteCount: Int
}
