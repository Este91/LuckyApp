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
    
    let detailViewModel: DetailViewModel
    
    init(detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
        renderScrollView()
    }
}

// MARK: UI
private extension OfferDetailViewController {
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupNavBar() {
        let favoriteItem = UIBarButtonItem(image: UIImage(named: "WhiteHeart"), style: .plain, target: self, action: #selector(favoriteItemPressed))
        favoriteItem.tintColor = "#222D34".hexaToUIColor()
            
        let shareItem = UIBarButtonItem(image: UIImage(named: "Share"), style: .plain, target: self, action: #selector(shareItemPressed))
        shareItem.tintColor = "#222D34".hexaToUIColor()
            
        navigationItem.rightBarButtonItems = [favoriteItem, shareItem]
    }
    
    @objc func shareItemPressed() {
        print("Share item pressed")
    }
    
    @objc func favoriteItemPressed() {
        print("Favorite item pressed")
    }
    
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
        imageView.setRemoteImage(imageUrl: detailViewModel.imageUrl)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 251)
        ])
        
        let brandLabel = buildLabel(text: detailViewModel.brand.uppercased(), textColor: "#718897".hexaToUIColor(), font: UIFont.systemFont(ofSize: 12), numberOfLines: 1)
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

        let favouritesLabel = buildLabel(text: detailViewModel.favoriteCount.intToFavoriteString(), textColor: "#718897".hexaToUIColor(), font: UIFont.systemFont(ofSize: 12), numberOfLines: 1)
        favoritesView.addSubview(favouritesLabel)
        NSLayoutConstraint.activate([
            favouritesLabel.topAnchor.constraint(equalTo: favoritesView.topAnchor),
            favouritesLabel.leftAnchor.constraint(equalTo: heartImageView.rightAnchor, constant: 5),
            favouritesLabel.trailingAnchor.constraint(equalTo: favoritesView.trailingAnchor),
            favouritesLabel.bottomAnchor.constraint(equalTo: favoritesView.bottomAnchor),
        ])
        
        let titleLabel = buildLabel(text: detailViewModel.title, textColor: "#222D34".hexaToUIColor(), font: UIFont.systemFont(ofSize: 32))
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
        
        let descriptionLabel = buildLabel(text: detailViewModel.description, textColor: "#222D34".hexaToUIColor(), font: UIFont.systemFont(ofSize: 16))
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
        
        let priceLabel = buildLabel(text: "PRICE", textColor: "#222D34".hexaToUIColor(), font: UIFont.systemFont(ofSize: 10), numberOfLines: 1)
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
        
        let oldPriceLabel = buildLabel(text: detailViewModel.price.old.uppercased(), textColor: "#9DB0BD".hexaToUIColor(), font: UIFont.systemFont(ofSize: 14), numberOfLines: 1)
        contentView.addSubview(oldPriceLabel)
        NSLayoutConstraint.activate([
            oldPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 7),
            oldPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            oldPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])

        let redemptionsCapLabel = buildLabel(text: "REDEMPTIONS CAP: " + detailViewModel.redemptionsCap.uppercased(), textColor: "#222D34".hexaToUIColor(), font: UIFont.systemFont(ofSize: 12), numberOfLines: 1)
        contentView.addSubview(redemptionsCapLabel)
        NSLayoutConstraint.activate([
            redemptionsCapLabel.topAnchor.constraint(equalTo: oldPriceLabel.bottomAnchor, constant: 32),
            redemptionsCapLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            redemptionsCapLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            redemptionsCapLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func buildLabel(text: String?, textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.prepareForAutolayout(.clear)
        label.text = text
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.font = font
        label.numberOfLines = numberOfLines
        return label
    }
}   

// MARK: ScrollView
private extension OfferDetailViewController {
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
