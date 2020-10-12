//
//  DetailViewModel.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 12/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

struct DetailViewModel {
    
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
    
    init(_ withModel: Detail) {
        self.id = withModel.id
        self.imageUrl = withModel.imageUrl
        self.brand = withModel.brand
        self.title = withModel.title
        self.tags = withModel.tags
        self.favoriteCount = withModel.favoriteCount
        self.description = withModel.description
        self.price = withModel.price
        self.expiration = withModel.expiration
        self.redemptionsCap = withModel.redemptionsCap
    }
}
