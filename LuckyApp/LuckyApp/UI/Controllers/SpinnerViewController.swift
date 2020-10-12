//
//  SpinnerViewController.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 12/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

final class LoadingViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        spinner.prepareForAutolayout(.clear)
        spinner.startAnimating()
        spinner.color = .black
        view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
