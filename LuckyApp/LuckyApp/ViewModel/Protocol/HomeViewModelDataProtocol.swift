//
//  HomeViewModelDataProtocol.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 11/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

protocol HomeViewModelDataProtocol: NSObjectProtocol {
    func offersDataUpdated()
    func offerDetailDataUpdated()
}
