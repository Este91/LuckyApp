//
//  Int+String.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 12/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

extension Int {
    func intToFavoriteString() -> String {
        var favoriteString = ""
        let thousandUnits = String(self / 1000)
        let hundredUnits = String((self % 1000) / 100)

        if thousandUnits == "0" {
            return favoriteString + String(self)
        } else {
            favoriteString = hundredUnits == "0" ? favoriteString + thousandUnits : favoriteString + thousandUnits + "," + hundredUnits
            return favoriteString + "K"
        }
    }
}
