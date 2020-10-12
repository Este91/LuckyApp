//
//  UIView+Autolayout.swift
//  LuckyApp
//
//  Created by Camila Perez Tellado on 12/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func prepareForAutolayout(_ background: UIColor? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = background == nil ? .white : background
    }
}

