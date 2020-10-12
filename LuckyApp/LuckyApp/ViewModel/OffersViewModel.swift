//
//  OffersViewModel.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 12/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation

struct OffersViewModel {
    
    let title: String
    let sections: [Section]
    
    init(_ withModel: Offers) {
        self.title = withModel.title
        self.sections = withModel.sections
    }
}

// MARK: Publics
extension OffersViewModel {
    func getItem(indexPath: IndexPath) -> Item {
        return sections[indexPath.section].items[indexPath.row - 1]
    }
    
    func getDetailUrl(_ indexPath: IndexPath) -> String {
        return sections[indexPath.section].items[indexPath.row - 1].detailUrl
    }
    
    func getSectionTitle(_ section: Int) -> String {
        return sections[section].title
    }
}
