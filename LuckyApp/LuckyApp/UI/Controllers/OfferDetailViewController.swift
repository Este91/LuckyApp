//
//  OfferDetailViewController.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

final class OfferDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        renderScrollView()
    }
}

// MARK: UI
private extension OfferDetailViewController {
    func renderScrollView() {
        let scrollView = buildScrollView()
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let contentView = buildContentView()
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let imageView = UIImageView()
        imageView.prepareForAutolayout(.lightGray)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 251)
        ])
        
        let brandLabel = UILabel()
        brandLabel.prepareForAutolayout(.clear)
        brandLabel.text = "BRAND".uppercased()
        brandLabel.textAlignment = .left
        brandLabel.font = UIFont.systemFont(ofSize: 12)
        brandLabel.numberOfLines = 1
        contentView.addSubview(brandLabel)
        NSLayoutConstraint.activate([
            brandLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            brandLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
        ])
        
        let favoritesView = UIView()
        favoritesView.prepareForAutolayout(.clear)
        contentView.addSubview(favoritesView)
        NSLayoutConstraint.activate([
            favoritesView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            favoritesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
        ])
        
        let heartImageView = UIImageView()
        heartImageView.prepareForAutolayout(.clear)
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.clipsToBounds = true
        heartImageView.image = UIImage(named: "Heart")
        favoritesView.addSubview(heartImageView)
        NSLayoutConstraint.activate([
            heartImageView.topAnchor.constraint(equalTo: favoritesView.topAnchor),
            heartImageView.leadingAnchor.constraint(equalTo: favoritesView.leadingAnchor),
            heartImageView.bottomAnchor.constraint(equalTo: favoritesView.bottomAnchor),
            heartImageView.heightAnchor.constraint(equalToConstant: 10),
            heartImageView.widthAnchor.constraint(equalToConstant: 10)
        ])

        let favouritesLabel = UILabel()
        favouritesLabel.prepareForAutolayout(.clear)
        favouritesLabel.text = "478"
        favouritesLabel.textAlignment = .left
        favouritesLabel.numberOfLines = 1
        favouritesLabel.font = UIFont.systemFont(ofSize: 12)
        favouritesLabel.textColor = "#718897".hexaToUIColor()
        favoritesView.addSubview(favouritesLabel)
        NSLayoutConstraint.activate([
            favouritesLabel.topAnchor.constraint(equalTo: favoritesView.topAnchor),
            favouritesLabel.leftAnchor.constraint(equalTo: heartImageView.rightAnchor, constant: 5),
            favouritesLabel.trailingAnchor.constraint(equalTo: favoritesView.trailingAnchor),
            favouritesLabel.bottomAnchor.constraint(equalTo: favoritesView.bottomAnchor),
        ])
        
        let titleLabel = UILabel()
        titleLabel.prepareForAutolayout(.clear)
        titleLabel.text = "25% discount on hamburguers"
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        titleLabel.textColor = "#222D34".hexaToUIColor()
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.prepareForAutolayout(.clear)
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pretium aenean pharetra magna ac placerat vestibulum lectus. Dictumst quisque sagittis purus sit amet volutpat consequat mauris. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Viverra aliquet eget sit amet tellus. Sit amet justo donec enim diam vulputate ut. Vel facilisis volutpat est velit egestas dui id. A scelerisque purus semper eget. Volutpat commodo sed egestas egestas fringilla phasellus. Urna molestie at elementum eu facilisis sed. Velit ut tortor pretium viverra. Sit amet volutpat consequat mauris nunc congue. Accumsan in nisl nisi scelerisque eu. Duis at consectetur lorem donec massa sapien faucibus et."
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = "#222D34".hexaToUIColor()
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
        
        let priceLabel = UILabel()
        priceLabel.prepareForAutolayout(.clear)
        priceLabel.text = "PRICE".uppercased()
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 1
        priceLabel.font = UIFont.systemFont(ofSize: 10)
        priceLabel.textColor = "#222D34".hexaToUIColor()
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
        
        let oldPriceLabel = UILabel()
        oldPriceLabel.prepareForAutolayout(.clear)
        oldPriceLabel.text = "EGP500".uppercased()
        oldPriceLabel.textAlignment = .left
        oldPriceLabel.numberOfLines = 1
        oldPriceLabel.font = UIFont.systemFont(ofSize: 14)
        oldPriceLabel.textColor = "#9DB0BD".hexaToUIColor()
        contentView.addSubview(oldPriceLabel)
        NSLayoutConstraint.activate([
            oldPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 7),
            oldPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            oldPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])

        let redemptionsCapLabel = UILabel()
        redemptionsCapLabel.prepareForAutolayout(.clear)
        redemptionsCapLabel.text = "REDEMPTIONS CAP: 4 TIMES".uppercased()
        redemptionsCapLabel.textAlignment = .left
        redemptionsCapLabel.numberOfLines = 1
        redemptionsCapLabel.font = UIFont.systemFont(ofSize: 12)
        redemptionsCapLabel.textColor = "#222D34".hexaToUIColor()
        contentView.addSubview(redemptionsCapLabel)
        NSLayoutConstraint.activate([
            redemptionsCapLabel.topAnchor.constraint(equalTo: oldPriceLabel.bottomAnchor, constant: 32),
            redemptionsCapLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            redemptionsCapLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            redemptionsCapLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func buildScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.prepareForAutolayout()
        return scrollView
    }
    
    func buildContentView() -> UIView {
        let contentView = UIView()
        contentView.prepareForAutolayout()
        return contentView
    }
}
