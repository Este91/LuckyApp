//
//  UIImageView+RemoteImage.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 11/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setRemoteImage(imageUrl: String, success:((UIImage)->Void)? = nil) {
        NetworkLayer.request(imageUrl: imageUrl) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
                        guard let self = self else { return }
                        self.backgroundColor = .clear
                        self.image = image
                    }, completion: { _ in
                        success?(image)
                })
            }
        }
    }
}
